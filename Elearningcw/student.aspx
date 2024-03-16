<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="student.aspx.vb" Inherits="Elearningcw.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Student</title>
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
                            Student Table
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="custom-grid table  table-sm">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student Name" SortExpression="STUDENT_NAME" />
                                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                                    <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                                    <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="Email Address" SortExpression="EMAIL_ADDRESS" />
                                    <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div>
                    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM STUDENT WHERE STUDENT_ID = :STUDENT_ID"
                        InsertCommand="INSERT INTO STUDENT (STUDENT_NAME, STUDENT_ID, CONTACT, DOB, EMAIL_ADDRESS, COUNTRY) VALUES (:STUDENT_NAME, :STUDENT_ID, :CONTACT, :DOB, :EMAIL_ADDRESS, :COUNTRY)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                        SelectCommand="SELECT STUDENT_NAME, STUDENT_ID, CONTACT, DOB, EMAIL_ADDRESS, COUNTRY FROM STUDENT"
                        UpdateCommand="UPDATE STUDENT SET STUDENT_NAME = :STUDENT_NAME, CONTACT = :CONTACT, DOB = :DOB, EMAIL_ADDRESS = :EMAIL_ADDRESS, COUNTRY = :COUNTRY WHERE STUDENT_ID = :STUDENT_ID">

                        <DeleteParameters>
                            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="STUDENT_NAME" Type="String"></asp:Parameter>
                            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="CONTACT" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="DOB" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="EMAIL_ADDRESS" Type="String"></asp:Parameter>
                            <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="STUDENT_NAME" Type="String"></asp:Parameter>
                            <asp:Parameter Name="CONTACT" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="DOB" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="EMAIL_ADDRESS" Type="String"></asp:Parameter>
                            <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
                            <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div>
                    <div class="col-md-4">
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                            <InsertItemTemplate>
                                <div class="container mt-3">
                                    <div class="card">
                                        <div class="card-header">
                                            Add New Row
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="STUDENT_IDTextBox">Student ID:</label>
                                                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="STUDENT_NAMETextBox">Student Name:</label>
                                                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="CONTACTTextBox">Contact:</label>
                                                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="DOBTextBox">DOB:</label>
                                                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' TextMode="Date" CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="EMAIL_ADDRESSTextBox">Email Address:</label>
                                                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="COUNTRYTextBox">Country:</label>
                                                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-control" />
                                            </div>
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Add Row" CssClass="btn btn-primary" Style="background-color: #004d99; color: white;" />
                                        </div>
                                    </div>

                                </div>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

