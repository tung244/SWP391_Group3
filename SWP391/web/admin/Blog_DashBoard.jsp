<%-- 
    Document   : Blog_DashBoard
    Created on : Mar 9, 2025, 10:56:49 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            /* Chỉ áp dụng cho giao diện dashboard */
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
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .dashboard-btn-outline {
                background-color: transparent;
                border: 1px solid #cbd5e1;
                padding: 0.5rem 1rem;
                border-radius: 0.25rem;
                cursor: pointer;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            /* Stats Section */
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

            .stat-title {
                color: #64748b;
                font-size: 0.875rem;
                margin-bottom: 0.5rem;
                text-transform: uppercase;
            }

            .stat-value {
                font-size: 2rem;
                font-weight: 700;
            }

            .stat-change {
                display: flex;
                align-items: center;
                margin-top: 0.5rem;
                font-size: 0.875rem;
            }

            .increase {
                color: #10b981;
            }

            .decrease {
                color: #ef4444;
            }

            /* Tabs Section */
            .blog-tabs {
                display: flex;
                border-bottom: 1px solid #e2e8f0;
                margin-bottom: 1.5rem;
            }

            .blog-tab {
                padding: 0.75rem 1rem;
                cursor: pointer;
                color: #64748b;
                font-weight: 500;
                border-bottom: 2px solid transparent;
            }

            .blog-tab.active {
                color: rgb(34,139,34);
                border-bottom: 2px solid rgb(34,139,34);
            }

            /* Badge */
            .blog-badge {
                display: inline-block;
                padding: 0.25rem 0.5rem;
                border-radius: 9999px;
                font-size: 0.75rem;
                font-weight: 500;
                margin-left: 0.5rem;
            }

            .blog-badge-primary {
                background-color: rgb(34,139,34);
                color: white;
            }

            .blog-badge-secondary {
                background-color: #e2e8f0;
                color: #64748b;
            }

            /* Filter Section */
            .filter-section {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 1.5rem;
            }

            .search-box {
                position: relative;
                margin-right: 1rem;
                flex-grow: 1;
                max-width: 400px;
            }

            .search-box input {
                width: 100%;
                padding: 0.5rem 1rem 0.5rem 2.5rem;
                border-radius: 0.25rem;
                border: 1px solid #cbd5e1;
                font-size: 0.875rem;
            }

            .search-icon {
                position: absolute;
                left: 0.75rem;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
            }

            /* Blog Table */
            .blog-table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
                border-radius: 0.5rem;
                overflow: hidden;
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
                text-transform: uppercase;
                font-size: 0.75rem;
            }

            .blog-table tr:last-child td {
                border-bottom: none;
                vertical-align: baseline;
            }

            .text-ellipsis {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 300px;
            }

            /* Status Badges */
            .status-badge {
                display: inline-block;
                padding: 0.25rem 0.5rem;
                border-radius: 9999px;
                font-size: 0.75rem;
                font-weight: 500;
            }

            .status-published {
                background-color: #d1fae5;
                color: #065f46;
            }

            .status-draft {
                background-color: #fee2e2;
                color: #991b1b;
            }

            .status-scheduled {
                background-color: #e0f2fe;
                color: #0369a1;
            }

            /* Dropdown */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                background-color: white;
                min-width: 160px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                z-index: 1;
                border-radius: 0.25rem;
                border: 1px solid #e2e8f0;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown-item {
                padding: 0.75rem 1rem;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            .dropdown-item:hover {
                background-color: #f1f5f9;
            }

            /* Chips */
            .chip {
                display: inline-block;
                padding: 0.25rem 0.5rem;
                border-radius: 9999px;
                font-size: 0.75rem;
                background-color: #e2e8f0;
                color: #475569;
                margin-right: 0.25rem;
                margin-bottom: 0.25rem;
            }

            /* Pagination */
            .blog-pagination {
                display: flex;
                justify-content: flex-end;
                margin-top: 1.5rem;
            }

            .pagination-item {
                padding: 0.5rem 0.75rem;
                border: 1px solid #e2e8f0;
                margin-left: -1px;
                cursor: pointer;
                background-color: white;
            }

            .pagination-item:first-child {
                border-top-left-radius: 0.25rem;
                border-bottom-left-radius: 0.25rem;
            }

            .pagination-item:last-child {
                border-top-right-radius: 0.25rem;
                border-bottom-right-radius: 0.25rem;
            }

            .pagination-item.active {
                background-color: rgb(34,139,34);
                color: white;
                border-color: rgb(34,139,34);
            }

            @media (max-width: 768px) {
                .stats-container {
                    grid-template-columns: 1fr;
                }

                .dashboard-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 1rem;
                }

                .filter-section {
                    flex-wrap: wrap;
                }

                .search-box {
                    max-width: 100%;
                    margin-right: 0;
                }

                .blog-table th, .blog-table td {
                    padding: 0.75rem 0.5rem;
                }

                .text-ellipsis {
                    max-width: 150px;
                }
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <jsp:include page="Common/Navbar.jsp"/>
            <!--end sidebar-wrapper-->
            <!--header-->
            <jsp:include page="Common/Search.jsp"/>
            <!--end header-->
            <!--page-wrapper-->
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
                                    <h3 class="stat-title">Tổng số bài viết</h3>
                                    <div class="stat-value">${total}</div>

                                </div>
                                <div class="stat-card">
                                    <h3 class="stat-title">Bài viết đã xuất bản</h3>
                                    <div class="stat-value">${sizePublic}</div>

                                </div>
                                <div class="stat-card">
                                    <h3 class="stat-title">Bản nháp</h3>
                                    <div class="stat-value">${sizeDraft}</div>

                                </div>
                                <div class="stat-card">
                                    <h3 class="stat-title">Tổng lượt xem</h3>
                                    <div class="stat-value">42,591</div>
                                </div>
                            </div>

                            <div class="blog-tabs">
                                <div class="blog-tab active">Tất cả <span class="blog-badge blog-badge-primary">${total}</span></div>
                                <div class="blog-tab">Đã xuất bản <span class="blog-badge blog-badge-secondary">${sizePublic}</span></div>
                                <div class="blog-tab">Bản nháp <span class="blog-badge blog-badge-secondary">${sizeDraft}</span></div>

                            </div>

                            <div class="filter-section">
                                <div class="search-box">
                                    <span class="search-icon">🔍</span>
                                    <input type="text" placeholder="Tìm kiếm bài viết...">
                                </div>

                                <button class="dashboard-btn-outline">
                                    Tác giả
                                    <span>▼</span>
                                </button>

                                <button class="dashboard-btn-outline">
                                    Ngày
                                    <span>▼</span>
                                </button>
                            </div>

                            <table style=" min-height: 350px;vertical-align: text-top" class="blog-table">
                                <thead>
                                    <tr>
                                        <th style="width: 5%;">ID</th>
                                        <th style="width: 30%;">Tiêu đề</th>

                                        <th style="width: 10%;">Tác giả</th>
                                        <th style="width: 10%;">Trạng thái</th>
                                        <th style="width: 15%;">Ngày cập nhật</th>
                                        <th style="width: 10%;">Lượt xem</th>
                                        <th style="width: 5%;">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                        <td>1</td>
                                        <td class="text-ellipsis">10 xu hướng thiết kế website mới nhất năm 2025</td>

                                        <td>Nguyễn Văn A</td>
                                        <td><span class="status-badge status-published">Đã xuất bản</span></td>
                                        <td>09/03/2025</td>
                                        <td>5,783</td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Success</button>
                                                <div class="dropdown-menu">	<a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                    <div class="dropdown-divider"></div>	<a class="dropdown-item" href="#">Separated link</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>


                                </tbody>
                            </table>

                            <div class="blog-pagination">
                                <div class="pagination-item">«</div>
                                <div class="pagination-item active">1</div>
                                <div class="pagination-item">2</div>
                                <div class="pagination-item">3</div>
                                <div class="pagination-item">4</div>
                                <div class="pagination-item">5</div>
                                <div class="pagination-item">»</div>
                            </div>
                        </main>
                    </div></div>
            </div></div>
            <jsp:include page="Common/Message.jsp"/>
            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
