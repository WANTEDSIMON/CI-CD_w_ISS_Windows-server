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

---

### 2. Add it to github

1. `echo "# CI-CD_w_ISS_Windows-server" >> README.md`
2. `git init`
3. `dotnet new gitignore`
4. `git add .`
5. `git commit -m "first commit"`
6. `git branch -M main`
7. `git remote add origin https://github.com/WANTEDSIMON/CI-CD_w_ISS_Windows-server.git`
8. `git push -u origin main`

---

### 3. Adding a controller to the ASP.NET Core MVC app

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


6. Vissit then localhost:Port/helloWorld/welcome

The following image shows the result:

![New Endpoint](img_readme/img_controller_helloworld_welcome.png)

7. Change the Welcome method to include two parameters as shown in the following code.
```csharp
// GET: /HelloWorld/Welcome/ 
// Requires using System.Text.Encodings.Web;
public string Welcome(string name, int numTimes = 1)
{
    return HtmlEncoder.Default.Encode($"Hello {name}, NumTimes is: {numTimes}");
}
```

8. Run the app, then go to, localhost:Port/helloWorld/welcome?name=Rick&numtimes=4

The following image shows the result:
![New Endpoint](img_readme/img_controller_helloworld_welcome_Rick4.png)


9. Replace the Welcome method with the following code:
```csharp
public string Welcome(string name, int ID = 1)
{
    return HtmlEncoder.Default.Encode($"Hello {name}, ID: {ID}");
}
```

10. Run the app, then go to, localhost:Port/helloWorld/welcome/3?name=Rick

The following image shows the result:
![New Endpoint](img_readme/img_controller_helloworld_welcome_helloRick3.png)

---

### 4. Adding a view
      
1. Currently the Index method returns a string with a message in the controller class.

   In HelloWorldController class, we replace the Index method with the following code:

```csharp

public IActionResult Index()
{
 return View();
}
```

#### Now we add in the view, 

2. Right-click on the Views folder, and then Add > New Folder and name the folder HelloWorld.
3. Right-click on the Views/HelloWorld folder, and then Add > New Item.

In the Add New Item dialog select Show All Templates.
In the Add New Item - MvcMovie dialog:

- In the search box in the upper-right, enter view
- Select Razor View - Empty
- Keep the Name box value, Index.cshtml.
- Select Add

Replacing the code in Views/HelloWorld/Index.cshtml Razor view file with: 

```CSHTML
@{
    ViewData["Title"] = "Index";
}

<h2>Index</h2>

<p>Hello from our View Template!</p>
```

4. Run the app, then go to, localhost:Port/helloWorld

The following image shows the result:

![New Endpoint](img_readme/img_controller_helloworld_view.png)

5. Change views and layout pages with Change the title, footer, and menu link in the layout file
6. Now relace content that is inside of the Views/Shared/_Layout.cshtml file

First we replace:
```CSHTML
<title>@ViewData["Title"] - MvcMovie</title>
```

With:
```CSHTML
<title>@ViewData["Title"] - Movie App</title>
```

Secoud we replace:
```CSHTML
<a class="navbar-brand" asp-area="" asp-controller="Home" asp-action="Index">MvcMovie</a>
```

With:
```CSHTML
<a class="navbar-brand" asp-area="" asp-controller="Movies" asp-action="Index">Movie App</a>
```

Third we replace:
```CSHTML
&copy; 2025 - MvcMovie - <a asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
```

With:
```CSHTML
&copy; 2025 - Movie App - <a asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
```

7. Run the app, then go to, localhost:Port/home/privacy

The following image shows the result:

![New Endpoint](img_readme/img_home_privacy.png)

8. Changing the title and <h2> element from / to:

From:
```CSHTML
@{
    ViewData["Title"] = "Index";
}

<h2>Index</h2>
```

To:

```CSHTML
@{
    ViewData["Title"] = "Movie List";
}

<h2>My Movie List</h2>
```

9. Run the app, then go to, localhost:Port/helloworld

The following image shows the result:

![New Endpoint](img_readme/img_helloworld_vc.png)

#### Passing Data from the Controller to the View

Inside yhe HelloWorldController.cs, we will change the Welcome method to add a Message and NumTimes value to the ViewData dictionary.

We replace:
```
public string Welcome(string name, int ID = 1)
{
 return HtmlEncoder.Default.Encode($"Hello {name}, ID: {ID}");
}
```

With:
```csharp
public IActionResult Welcome(string name, int numTimes = 1)
{
  ViewData["Message"] = "Hello " + name;
  ViewData["NumTimes"] = numTimes;
  return View();
}
```

Pluss guess it was time to remobe the comment from the file.

10. Createing Welcome.cshtml a Welcome view template.

Containing:
```CSHTML
@{
    ViewData["Title"] = "Welcome";
}

<h2>Welcome</h2>

<ul>
    @for (int i = 0; i < (int)ViewData["NumTimes"]!; i++)
    {
        <li>@ViewData["Message"]</li>
    }
</ul>
```

It is a simple loop that displays the message as many times as specified by the NumTimes value.

11. Run the app, then go to, localhost:Port/helloworld/welcome?name=Rick&numtimes=4

The following image shows the result:

![New Endpoint](img_readme/img_hellorick_welcome_view.png)

### 5. Adding model to the ASP.NET Core MVC app

Addeding classes for managing movies in a database. These classes are the "Model" part of the MVC app. With Entity Framework Core

The used model classes created are known as "POCO classes, from Plain Old CLR Objects." -POCO classes don't have any dependency on EF Core. They only define the properties of the data to be stored in the database.

First we create the model classes then EF Core will help with creating the database.

#### Add a data model class

1. Right-click the Models folder > Add > Class. Name the file Movie.cs.
2. Next Update the Models/Movie.cs file with the following code:



---

### Extra 1. Tried set up the code from terminal 

1. Install .NET SDK: Ensure .NET SDK is installed.
2. Create Project: `dotnet new mvc -n MyMvcApp`
3. Navigate to Directory: `cd MyMvcApp`
4. Run Project: `dotnet run`
5. Open in IDE: `start devenv .`

Problem was finding solution file, code could run but could not continue with the guid.