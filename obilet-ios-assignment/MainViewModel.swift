//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    
    private let clientService = ClientService.shared
    
    private let networkManager = NetworkManager.shared
    
    private let sessionStorageManager = SessionStorageManager.shared
    
    private let iosDeviceType = 2 //This indicates iOS according to OBilet’s documentation.
    
    @Published
    var showSplashScreen: Bool = true
    
    init () {
        Task {
           await getOutboundIPAddress()
        }
    }
    
    private func getOutboundIPAddress() async {
        showSplashScreen = true
        do {
            let urlAsString = APIConfig.outboundIpURL
            
            let url = URL(string: urlAsString)
            
            var request = URLRequest(url: url!)
            
            request.httpMethod = HttpMethod.GET.rawValue
            
            request.setValue("text/plain", forHTTPHeaderField: "Accept")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 500
                print("status code \(statusCode), description \(LocalizedStrings.somethingWentWrong)")
                return
            }
            
            guard var ip = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
                  !ip.isEmpty else {
                print("Empty/invalid IP")
                showSplashScreen = false
                return
            }
          
            if ip.first == "\"", ip.last == "\"" {
                ip.removeFirst(); ip.removeLast()
            }
            
            print("ip is \(ip)")
 
            await getSession(for: ip)
            
            
        } catch {
            print("Something went wrong while fetching ip address: \(error.localizedDescription)")
            showSplashScreen = false
        }
    }
    
    private func getSession(for ipAddress: String) async {
        
        do {
            let body = GetSessionRequestModel(
                type: iosDeviceType,
                connection: Connection(
                    ipAddress: ipAddress
                ),
                application: Application(
                    version: AppInfo.versionName,
                    equipmentId: GetUniqueDeviceIdentifierUseCase.callAsFunction()
                )
            )
            
            let resource =  try await clientService.getSession(body: body)
            
            if let _ = resource as? Resource.Error {
                showSplashScreen = false
            } else if resource is Resource.Loading {
                showSplashScreen = true
                
            } else if let successResource = resource as? Resource.Success {
                showSplashScreen = false
                if let data = successResource.data {
                    sessionStorageManager
                        .cacheSessionAndDeviceId(
                            session: Session(
                                sessionId: data.sessionId,
                                deviceId: data.deviceId
                            )
                        )
                }
            }
            
        }
        catch {
            print("Something went wrong while fetching get session: \(error.localizedDescription)")
            showSplashScreen = false
        }
    }
    
}
