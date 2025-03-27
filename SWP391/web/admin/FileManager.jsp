<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
    </head>
    <body>
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="page-content">
                    <jsp:include page="Common/Navbar.jsp"/>
                    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                        <div class="breadcrumb-title pe-3">Dashboard</div>
                        <div class="ps-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item active" aria-current="page">File Manager</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <!-- Giữ nguyên phần bên trái -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-grid"> 
                                        <a href="javascript:;" class="btn btn-primary">+ Add File</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="mb-0 text-primary font-weight-bold">45.5 GB <span class="float-end text-secondary">50 GB</span></h5>
                                    <div class="mt-3"></div>
                                    <div class="d-flex align-items-center">
                                        <div class="fm-file-box bg-light-primary text-primary"><i class='bx bx-image'></i></div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">Images</h6>
                                            <p class="mb-0 text-secondary">1,756 files</p>
                                        </div>
                                        <h6 class="text-primary mb-0">15.3 GB</h6>
                                    </div>
                                    <div class="d-flex align-items-center mt-3">
                                        <div class="fm-file-box bg-light-success text-success"><i class='bx bx-image'></i></div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">Thumbnail</h6>
                                            <p class="mb-0 text-secondary">123 files</p>
                                        </div>
                                        <h6 class="text-primary mb-0">256 MB</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-lg-9">
                            <div class="card" style="height: 530px;">
                                <div class="card-body">
                                    <div class="fm-search">
                                        <div class="mb-0">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-text bg-transparent"><i class='bx bx-search'></i></span>
                                                <input type="text" class="form-control" placeholder="Search the files">
                                                <div style="padding-left: 10px" class="ms-auto">
                                                    <a style="padding-top: 15px;height: 50px" href="javascript:;" class="btn btn-sm btn-outline-secondary">View all</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="table-responsive mt-3" style="height: 430px; overflow-y: auto;">
                                        <table class="table table-striped table-hover table-sm mb-0">
                                            <thead style="position: sticky; top: 0; background: white; z-index: 1;">
                                                <tr>
                                                    <th>Name <i class='bx bx-up-arrow-alt ms-2'></i></th>
                                                    <th>Last Modified</th>
                                                    <th>File Path</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="file" items="${fileList}">
                                                    <tr>
                                                        <td style="max-width: 200px;">
                                                            <div class="d-flex align-items-center">
                                                                <div><i class='bx ${file.icon} me-2 font-24'></i></div>
                                                                <div class="font-weight-bold ${file.icon.contains('pdf') ? 'text-danger' : 'text-primary'}" 
                                                                     style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" 
                                                                     title="${file.name}">
                                                                    <a href="#" data-bs-toggle="modal" data-bs-target="#imageModal" 
                                                                       data-path="${file.path}" data-name="${file.name}">
                                                                        ${file.name}
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            ${file.lastModified}
                                                        </td>
                                                        <td style="max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" 
                                                            title="${file.path}">
                                                            ${file.path}
                                                        </td>
                                                        <td><i class='bx bx-dots-horizontal-rounded font-24'></i></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal giữ nguyên -->
                        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <img width="300px" height="300px" id="modalImage" src="" class="img-fluid" alt="Image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var imageModal = document.getElementById('imageModal');
                    imageModal.addEventListener('show.bs.modal', function (event) {
                        var link = event.relatedTarget;
                        var filePath = link.getAttribute('data-path');
                        var fileName = link.getAttribute('data-name');

                        var modalImage = imageModal.querySelector('#modalImage');
                        var modalTitle = imageModal.querySelector('#imageModalLabel');

                        modalImage.src = filePath;
                        modalTitle.textContent = fileName;
                    });
                });
            </script>
            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
