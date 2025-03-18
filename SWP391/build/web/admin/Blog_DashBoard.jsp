
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .dashboard-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1.5rem;
            }

            .dashboard-btn-primary {
                background-color: rgb(34,139,34);
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 0.25rem;
                border: none;
                cursor: pointer;
            }

            .stats-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 1rem;
                margin-bottom: 2rem;
            }

            .stat-card {
                background-color: white;
                border-radius: 0.5rem;
                padding: 1.5rem;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .filter-section {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 1.5rem;
            }

            .search-box {
                position: relative;
                flex-grow: 1;
                max-width: 400px;
            }

            .search-box input {
                width: 100%;
                padding: 0.5rem 1rem 0.5rem 2.5rem;
                border-radius: 0.25rem;
                border: 1px solid #cbd5e1;
            }

            .search-icon {
                position: absolute;
                left: 0.75rem;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
            }

            .date-filter input {
                padding: 0.5rem;
                border-radius: 0.25rem;
                border: 1px solid #cbd5e1;
            }

            .blog-table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
                border-radius: 0.5rem;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .blog-table th, .blog-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #e2e8f0;
            }

            .blog-table th {
                background-color: #f1f5f9;
                font-weight: 600;
                color: #64748b;
            }

            @media (max-width: 768px) {
                .filter-section {
                    flex-direction: column;
                    align-items: stretch;
                }
                .search-box {
                    max-width: 100%;
                }
            }
            /* Style cho nút gạt với tên class unique */
            .xai-toggle-wrapper {
                position: relative;
                width: 37.5px;
                height: 21.25px;
                display: inline-block;
            }

            .xai-toggle-input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .xai-toggle-slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc; /* Màu xám khi tắt */
                transition: 0.4s;
                border-radius: 21.25px;
            }

            .xai-toggle-slider:before {
                position: absolute;
                content: "";
                height: 16.25px;
                width: 16.25px;
                left: 2.5px;
                bottom: 2.5px;
                background-color: white;
                transition: 0.4s;
                border-radius: 50%;
            }

            .xai-toggle-input:checked + .xai-toggle-slider {
                background-color: rgb(34,139,34);
            }

            .xai-toggle-input:checked + .xai-toggle-slider:before {
                transform: translateX(16.25px);
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="Common/Navbar.jsp"/>
            
            <div class="page-wrapper">
                <div style="padding: 0" class="page-content-wrapper">
                    <div style="background-color: white" class="page-content">
                        <main class="container">
                            <div class="dashboard-header">
                                <h2>Tổng quan Blog</h2>
                                <a href="create_blog" class="dashboard-btn-primary">
                                    <i>+</i> Thêm Bài Viết Mới
                                </a>
                            </div>

                            <div class="stats-container">
                                <div class="stat-card">
                                    <h4>Tổng số bài viết</h4>
                                    <div style="font-size: 25px">${total}</div>
                                </div>
                                <div class="stat-card">
                                    <h4>Bài viết đã xuất bản</h4>
                                    <div style="font-size: 25px">${sizePublic}</div>
                                </div>
                                <div class="stat-card">
                                    <h4>Bản nháp</h4>
                                    <div style="font-size: 25px">${sizeDraft}</div>
                                </div>
                                <div class="stat-card">
                                    <h4>Tổng lượt xem</h4>
                                    <div style="font-size: 25px">42,591</div>
                                </div>
                            </div>

                            <!-- Filter Section -->
                            <form action="blog_dashboard" method="get" class="filter-section">
                                <div class="status-filter">
                                    <label>Loại:</label>
                                    <select style="padding: 10px;
                                            border: 1px solid #cbd5e1;
                                            border-radius: 6px" name="type" onchange="this.form.submit()" class="status-select">
                                        <option value="All">Tất cả</option>
                                        <option value="Public">Đã xuất bản</option>
                                        <option value="Draft">Bản nháp</option>
                                    </select>
                                </div>
                                <div class="search-box">
                                    <span class="search-icon">🔍</span>
                                    <input type="text" name="search" placeholder="Tìm kiếm tiêu đề..." 
                                           value="${param.search}">
                                </div>
                                <div class="date-filter">
                                    <label for="dateFrom">From:</label>
                                    <input type="date" name="dateFrom" value="${param.dateFrom}">
                                </div>
                                <div class="date-filter">
                                    <label for="dateTo">To:</label>
                                    <input type="date" name="dateTo" value="${param.dateTo}">
                                </div>
                                <button type="submit" class="dashboard-btn-primary">Lọc</button>
                            </form>

                            <div style="box-shadow: none" class="card">
                                <div style="padding:0;" class="card-body">
                                    <div style="min-height: 300px;" class="table-responsive">
                                        <table class="blog-table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Người tạo</th>
                                                    <th>Tình trạng</th>
                                                    <th>Lượt xem</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="list" items="${list}">
                                                    <tr>
                                                        <td>${list.blog_id}</td>
                                                        <td>${list.title_meta}</td>
                                                        <td>${list.created_date_blog}</td>
                                                        <td>${list.author_name}</td>
                                                        <td>
                                                            <label class="xai-toggle-wrapper">
                                                                <input type="checkbox" class="xai-toggle-input" 
                                                                       data-blog="${list.blog_id}" 
                                                                       <c:if test="${list.status_blog == 'Public'}">checked</c:if> 
                                                                           onclick="updateStatus(this)">
                                                                       <span class="xai-toggle-slider"></span>
                                                                </label>
                                                            </td>
                                                            <td>320,800</td>
                                                            <td>
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-success dropdown-toggle" 
                                                                            data-bs-toggle="dropdown">
                                                                        Action
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="update_blog?blog_id=${list.blog_id}">Edit</a>

                                                                    <a class="dropdown-item" href="javascript:void(0);" data-blog="${list.blog_id}" onclick="confirmDelete(this)">Delete</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <nav style="margin-top: 20px;
                                             display: flex;
                                             justify-content: end" aria-label="Page navigation example">
                                            <ul class="pagination round-pagination">

                                                <li class="page-item"><button onclick="previousPage()" class="page-link">Previous</button>
                                                </li>

                                                <c:forEach var="i" begin="${currentPage}" end="${nextNumber}">
                                                    <li class="page-item"><button onclick="choosePage(this)" data-index ="${i}" class="page-link" href="blog_dashboard?page=${i}">${i}</button>
                                                    </li>
                                                    <input type="hidden" value="${numberPage}" id="numberPage"/>
                                                </c:forEach>
                                                <li class="page-item"><button class="page-link" type="button">...</button>
                                                </li>

                                                <li class="page-item"><button class="page-link" onclick="nextPage()">Next</button>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
        <script>
            function confirmDelete(element) {
                var blog_id = element.getAttribute("data-blog");
                if (confirm("Bạn có chắc chắn muốn xóa bài viết này không?")) {
                    window.location.href = "delete_blog?blog_id=" + blog_id;
                }
            }
            function previousPage() {
                var param = new URLSearchParams(window.location.search);
                var page = parseInt(param.get("page"));
                if (!isNaN(page) && page > 1) {
                    param.set("page", page - 1);
                    window.location.search = param.toString();
                }
            }
            function choosePage(element) {
                var param = new URLSearchParams(window.location.search);
                var index = element.getAttribute("data-index");

                if (!index)
                    return;

                param.set("page", index);

                window.location.search = param.toString();
            }
            function nextPage() {
                var numberPage = document.getElementById("numberPage").value;

                var param = new URLSearchParams(window.location.search);
                var index = parseInt(param.get("page"));
                if (param.get("page") < numberPage) {
                    param.set("page", index + 1);
                    window.location.search = param.toString();
                }

            }


        </script>
        <script>
            function updateStatus(Element) {
                const blog = Element.getAttribute("data-blog");
                        $.ajax({
                            url: "update_status_blog",
                            type: "POST",
                            data: {
                                
                                blog: blog
                            },
                            success: function (response) {
                                if (response.status === "oke") {
                                    toastr.success("Update Status thành công");

                                } else if (response.status === "notOke") {
                                    toastr.success("Update Status thất bại");

                                } else {
                                    toastr.error("Error.");
                                }
                            },
                            error: function (xhr, status, error) {
                                alert("Error");
                            }
                        });
            }



        </script>
    </body>
</html>