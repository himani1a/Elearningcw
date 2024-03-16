<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="Elearningcw.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Learning Homepage</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('e.png');  
        }
        .navbar-custom {
            background-color: #004d99; /* Custom background color */
            color: #ffffff; /* Custom text color */
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-nav .nav-link {
            color: #ffffff; /* Custom text color for brand and links */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-custom">
            <a class="navbar-brand" href="#">E-Learning</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="student.aspx">Student</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="instructor.aspx">Instructor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lesson.aspx">Lesson</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="course.aspx">Course</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lessondetails.aspx">Lesson Details</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="studentenroll.aspx">Student Enrollment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="teachcins.aspx">Instructor coursedetail</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bestcourse.aspx">Best Courses</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-4">
            <h1>Welcome to the E-Learning Platform</h1>
            <p>This is the homepage of the E-Learning platform. Navigate through the menu to access different sections.</p>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
