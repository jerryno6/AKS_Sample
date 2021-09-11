using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Hosting;

namespace AKS_Sample.Services.GreetService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        // Additional configuration is required to successfully run gRPC on macOS.
        // For instructions on how to configure Kestrel and gRPC clients on macOS, visit https://go.microsoft.com/fwlink/?linkid=2099682
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    //todo: If you want to config for certificate in production. 
                    // webBuilder.ConfigureKestrel(options =>
                    // {
                    // 	options.Listen(IPAddress.Any, 7001, listenOptions =>
                    // 	{
                    // 		listenOptions.Protocols = HttpProtocols.Http2;
                    // 		// listenOptions.UseHttps("<path to .pfx file>", "<certificate password>");
                    // 	});
                    // });
					
                    webBuilder.UseStartup<Startup>();

#if DEBUG
                    //todo: only use this to run in MACOS as develop environment
                    if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX)) {
                        webBuilder.ConfigureKestrel(options =>
                        {
                            // Setup a HTTP/2 endpoint without TLS.
                            options.ListenLocalhost(7001, listenOptions =>
                            {
                                listenOptions.Protocols = HttpProtocols.Http2;
                                // listenOptions.UseHttps("<path to .pfx file>", "<certificate password>");
                            });
                        });
                    }
#endif

                });
    }
}