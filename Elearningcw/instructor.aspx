<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="instructor.aspx.vb" Inherits="Elearningcw.instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Instructor</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: #004d99; /* Custom background color */
            color: #ffffff; /* Custom text color */
        }

            .navbar-custom .navbar-brand,
            .navbar-custom .navbar-nav .nav-link {
                color: #ffffff; /* Custom text color for brand and links */
            }

        .custom-grid, .custom-grid th, .custom-grid td {
            border: 1px solid #dee2e6; /* Bootstrap's default border color */
        }

        .custom-grid {
            border-radius: 0.25rem; /* Rounded corners for the table */
            overflow: hidden; /* Ensures the rounded corners are visible */
            box-shadow: 0 .125rem .25rem rgba(0,0,0,.075); /* Bootstrap's default shadow for cards */
        }

        .table-sm th, .table-sm td {
            padding: 0.3rem; /* Reducing padding to make rows tighter */
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
       <div class="container-fluid pl-3 pt-3">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            Instructor Table
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="custom-grid table table-sm">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                       </div>
                        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            DeleteCommand="DELETE FROM INSTRUCTOR WHERE INSTRUCTURE_ID = :INSTRUCTURE_ID"
                            InsertCommand="INSERT INTO INSTRUCTOR (INSTRUCTURE_ID, INSTRUCTURE_NAME, INSTRUCTURE_CONTACT, INSTRUCTURE_ADDRESS) VALUES (:INSTRUCTURE_ID, :INSTRUCTURE_NAME, :INSTRUCTURE_CONTACT, :INSTRUCTURE_ADDRESS)"
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                            SelectCommand="SELECT INSTRUCTURE_ID, INSTRUCTURE_NAME, INSTRUCTURE_CONTACT, INSTRUCTURE_ADDRESS FROM INSTRUCTOR"
                            UpdateCommand="UPDATE INSTRUCTOR SET INSTRUCTURE_NAME = :INSTRUCTURE_NAME, INSTRUCTURE_CONTACT = :INSTRUCTURE_CONTACT, INSTRUCTURE_ADDRESS = :INSTRUCTURE_ADDRESS WHERE INSTRUCTURE_ID = :INSTRUCTURE_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="INSTRUCTURE_ID" Type="Decimal"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="INSTRUCTURE_ID" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_NAME" Type="String"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_CONTACT" Type="String"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_ADDRESS" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="INSTRUCTURE_NAME" Type="String"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_CONTACT" Type="String"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_ADDRESS" Type="String"></asp:Parameter>
                                <asp:Parameter Name="INSTRUCTURE_ID" Type="Decimal"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    
                        <div class="col-md-4">
                            <asp:FormView ID="FormViewInstructor" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                                <InsertItemTemplate>
                                    <div class="container mt-3">
                                        <div class="card">
                                            <div class="card-header">
                                                Add New Row
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label for="INSTRUCTOR_NAMETextBox">Instructor Name:</label>
                                                    <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="INSTRUCTOR_IDTextBox">Instructor ID:</label>
                                                    <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="INSTRUCTOR_CONTACTTextBox">Instructor Contact:</label>
                                                    <asp:TextBox ID="INSTRUCTOR_CONTACTTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_CONTACT") %>' CssClass="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="INSTRUCTOR_ADDRESSTextBox">Instructor Address:</label>
                                                    <asp:TextBox ID="INSTRUCTOR_ADDRESSTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ADDRESS") %>' CssClass="form-control" />
                                                 </div>
                                        <asp:Button ID="InsertButtonInstructor" runat="server" CommandName="Insert" Text="Add Row" CssClass="btn btn-primary" Style="background-color: #004d99; color: white;" />
                                    </div>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
