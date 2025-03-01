# CI-CD_w_ISS_Windows-server


### 1. Start setting up ASP.NET Core MVC

1. Oppen Visual Studio (BE SURE YOU HAVE WITH: ASP.NET and web development workload.)
2. Create the web app
3. Create new project.
4. Choose ASP.NET Core Web App (Model-View-Controller) > Next.
5. Enter MvcMovie for Project name.
6. When code created - run program
7. Select Yes if you trust the IIS Express SSL certificate.
8. Select Yes if you agree to trust the development certificate.


The following image shows first run:

![New Endpoint](img_readme/img_first_run.png)

### 2. Add it to github

1. `echo "# CI-CD_w_ISS_Windows-server" >> README.md`
2. `git init`
3. `dotnet new gitignore`
4. `git add .`
5. `git commit -m "first commit"`
6. `git branch -M main`
7. `git remote add origin https://github.com/WANTEDSIMON/CI-CD_w_ISS_Windows-server.git`
8. `git push -u origin main`


3. Adding a controller to the ASP.NET Core MVC app

1. In Solution Explorer, right-click Controllers > Add > Controller.
2. In the Add New Scaffolded Item dialog box, select MVC Controller - Empty > Add.
3. Name the controller `HelloWorldController.cs` and select Add.
4. Replace the contents of the `HelloWorldController.cs` file:
```csharp
using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers;

public class HelloWorldController : Controller
{
    // 
    // GET: /HelloWorld/
    public string Index()
    {
        return "This is my default action...";
    }
    // 
    // GET: /HelloWorld/Welcome/ 
    public string Welcome()
    {
        return "This is the Welcome action method...";
    }
}
```
5. Running the program and vissit localhost:Port/helloworld

The following image shows the run:

![New Endpoint](img_readme/img_controller_helloworld.png)

### Extra 1. Tried set up the code from terminal 

1. Install .NET SDK: Ensure .NET SDK is installed.
2. Create Project: `dotnet new mvc -n MyMvcApp`
3. Navigate to Directory: `cd MyMvcApp`
4. Run Project: `dotnet run`
5. Open in IDE: `start devenv .`

Problem was finding solution file, code could run but could not continue with the guid.