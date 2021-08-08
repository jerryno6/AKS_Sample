using System;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using AKS_Sample.GreetService;
using Grpc.Net.Client;

namespace AKS_Sample.Client.Console
{
    class Program
    {
        static async Task Main(string[] args)
        {
            try
            {
                var serverAddress = "https://localhost";

#if abc
                if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
                {
                    // The following statement allows you to call insecure services. To be used only in development environments.
                    AppContext.SetSwitch(
                        "System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", true);
                    serverAddress = "http://localhost";
                }
#endif

                // The port number(5001) must match the port of the gRPC server.
                using var channel = GrpcChannel.ForAddress(serverAddress);
                var client = new Greeter.GreeterClient(channel);
                var reply = await client.SayHelloAsync(new HelloRequest { Name = "VuLe" });
                System.Console.WriteLine("Greeting: " + reply.Message);
                System.Console.WriteLine("Press any key to exit...");
                System.Console.ReadKey();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message);
            }

        }
    }

}