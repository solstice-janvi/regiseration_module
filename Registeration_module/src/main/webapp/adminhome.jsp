<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        clifford: '#da373d',
                    }
                }
            }
        }
    </script>
    <title>Admin Home</title>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
        }
    </style>
    <style>
   .active-section {
    display: block;
    border: 2px solid #8080809c;
    margin: 50px;
    padding: 50px;
}
.button {
  position: relative;
  width: 150px;
  height: 40px;
  cursor: pointer;
  display: flex;
  align-items: center;
  border: 1px solid #34974d;
  background-color: #3aa856;
}

.button, .button__icon, .button__text {
  transition: all 0.3s;
}

.button .button__text {
  transform: translateX(30px);
  color: #fff;
  font-weight: 600;
}

.button .button__icon {
  position: absolute;
  transform: translateX(109px);
  height: 100%;
  width: 39px;
  background-color: #34974d;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button .svg {
  width: 30px;
  stroke: #fff;
}

.button:hover {
  background: #34974d;
}

.button:hover .button__text {
  color: transparent;
}

.button:hover .button__icon {
  width: 148px;
  transform: translateX(0);
}

.button:active .button__icon {
  background-color: #2e8644;
}

.button:active {
  border: 1px solid #2e8644;
}
        .hidden-section {
            display: none;
        }
        .active-section {
            display: block;
        }
 .box1{
 display: flex;
    justify-content: space-between;
    margin: 20px;
 }
    </style>
    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.classList.add('hidden-section');
                section.classList.remove('active-section');
            });

            const activeSection = document.getElementById(sectionId);
            activeSection.classList.remove('hidden-section');
            activeSection.classList.add('active-section');
        }
    </script>
</head>
<body>
    <div class="bg-gray-100 dark:bg-gray-900 dark:text-white text-gray-600 h-screen flex overflow-hidden text-sm">
        <div class="dark:bg-gray-900 dark:border-gray-800 w-20 flex-shrink-0 border-r border-gray-200 flex-col hidden sm:flex" style="width: 24%;">
            <div class="h-16 text-blue-500 flex items-center justify-center"></div>
            <div class="flex mx-auto flex-grow mt-4 flex-col text-gray-400 space-y-4" style="width: 100%; margin: 0;">
                <!-- Inspiration from UI Design Daily -->
                <div class="grid min-h-screen place-content-center">
                    <div class="bg-white shadow-lg rounded-xl max-w-xs mx-auto relative">
                        <header class="bg-gradient-to-r from-indigo-500 to-indigo-600 transform flex items-center mb-10 py-8 px-6">
                            <img class="rounded-full w-20 h-20 ring-4 ring-opacity-20 ring-gray-200" src="https://randomuser.me/api/portraits/women/79.jpg" alt="Admin">
                            <div class="ml-5">
                                <h1 class="text-white tracking-wide text-lg">
                                 <%
                                    String adminName = (String) request.getAttribute("adminName");
                                    if (adminName != null) {
                                        out.print(adminName);
                                    }
                                    %>
                                </h1>
                                <form action="Log">
                                	<button type= "submit">LogOut</button>
                                </form>
                            </div>
                        </header>
                        <ul class="px-8 relative pb-5">
                            <div class="bg-indigo-600 w-1 h-14 absolute left-0" style="bottom: 15.235rem;"></div>
                            <li class="flex items-center text-gray-900 text-md py-4 text-indigo-600">
                                <span class="text-gray-400 mr-5">
                                    <svg class="w-6 h-6 text-indigo-600" fill="#5046e5" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                                    </svg>
                                </span>
                                <a href="javascript:void(0)" onclick="showSection('home')">Home</a>
                            </li>
                            <li class="flex items-center text-gray-900 text-md py-4">
                                <span class="text-gray-400 mr-5">
                                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17V7m0 10a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h2a2 2 0 012 2m0 10a2 2 0 002 2h2a2 2 0 002-2M9 7a2 2 0 012-2h2a2 2 0 012 2m0 10V7m0 10a2 2 0 002 2h2a2 2 0 002-2V7a2 2 0 00-2-2h-2a2 2 0 00-2 2"></path>
                                    </svg>
                                </span>
                                <a href="javascript:void(0)" onclick="showSection('livesession')">Live Session</a>
                            </li>
                            <li class="flex items-center text-gray-900 text-md py-4">
                                <span class="text-gray-400 mr-5">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 4v12l-4-2-4 2V4M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                </span>
                                <a href="javascript:void(0)" onclick="showSection('postsessions')">Post Sessions</a>
                            </li>
                            <li class="flex items-center text-gray-900 text-md py-4">
                                <span class="text-gray-400 mr-5">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path>
                                    </svg>
                                </span>
                                <a href="javascript:void(0)" onclick="showSection('messages')">Messages</a>
                            </li>
                            <li class="flex items-center text-gray-900 text-md py-4">
                                <span class="text-gray-400 mr-5">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
                                    </svg>
                                </span>
                                <a href="javascript:void(0)" onclick="showSection('library')">Library</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex-grow flex flex-col">
            <div id="dashboard" class="section hidden-section">
            <div class = "box1">
                <h1>Dashboard</h1>
               <form action="userform.html" method="">
                <button type="submit" class="button">
           
  <span class="button__text">Add User</span>
  <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
</button>
</form>
 </div>
                <table class="w-full text-left">
                    <thead>
                        <tr class="text-gray-400">
                            <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">ID</th>
                            <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">Name</th>
                            <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800 hidden md:table-cell">Email</th>
                            <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">Password</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-600 dark:text-gray-100" id="tablebody">
                    <%
                List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
                if (users != null) {
                    for (Map<String, String> user : users) {
                        out.print("<tr>");
                        out.print("<td>" + user.get("id") + "</td>");
                        out.print("<td>" + user.get("name") + "</td>");
                        out.print("<td>" + user.get("email") + "</td>");
                        out.print("<td>" + user.get("password") + "</td>");
                        out.print("</tr>");
                    }
                }
                    %>
                    </tbody>
                </table>
            </div>
            <div id="livesession" class="section hidden-section">
                <h1>Live Session</h1>
                <!-- Add your live session content here -->
            </div>
            <div id="postsessions" class="section hidden-section">
                <h1>Post Sessions</h1>
                <!-- Add your post sessions content here -->
            </div>
            <div id="messages" class="section hidden-section">
                <h1>Messages</h1>
                <!-- Add your messages content here -->
            </div>
            <div id="home" class="section active-section">
                <h1>home</h1>
                
            </div>
            <div id="library" class="section hidden-section">
                <h1>Library</h1>
                <!-- Add your library content here -->
            </div>
        </div>
    </div>
</body>
</html>
