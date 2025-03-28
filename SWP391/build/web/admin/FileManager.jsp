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
                                        <!-- Nút kích hoạt modal -->
                                        <button type="button" class="btn btn-primary" onclick="document.getElementById('uploadModal').style.display = 'block'">+ Add File</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="mb-0 text-primary font-weight-bold">Total :<span class="float-end text-secondary">${totalImage}</span></h5>
                                    <div class="mt-3"></div>
                                    <div class="d-flex align-items-center">
                                        <div class="fm-file-box bg-light-primary text-primary"><i class='bx bx-image'></i></div>
                                        <div class="flex-grow-1 ms-2">
                                            <a style="cursor: pointer" href="file_manager?folder=images">
                                                <h6 class="mb-0">Images</h6>
                                                <p class="mb-0 text-secondary">${numberimg}</p></a>
                                        </div>
                                        <h6 class="text-primary mb-0">${sizeimg}</h6>
                                    </div>
                                    <div class="d-flex align-items-center mt-3">
                                        <div class="fm-file-box bg-light-success text-success"><i class='bx bx-image'></i></div>
                                        <div class="flex-grow-1 ms-2">
                                            <a style="cursor: pointer" href="file_manager?folder=thumb">
                                                <h6 class="mb-0">Thumbnail</h6>
                                                <p class="mb-0 text-secondary">${numberthumb}</p>
                                            </a>
                                        </div>
                                        <h6 class="text-primary mb-0">${sizethumb}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-lg-9">
                            <div class="card" style="height: 530px;">
                                <div class="card-body">
                                    <div class="fm-search">
                                        <div class="mb-0">
                                            <form method="get" action="file_manager">
                                                <div class="input-group input-group-lg">
                                                    <span class="input-group-text bg-transparent"><i class='bx bx-search'></i></span>
                                                    <input name="search" type="text" class="form-control" placeholder="Search the files">
                                                    <div style="padding-left: 10px" class="ms-auto">
                                                        <a style="padding-top: 15px;height: 50px" href="file_manager" class="btn btn-sm btn-outline-secondary">Refresh</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="table-responsive mt-3" style="height: 430px; overflow-y: auto;">
                                        <table class="table table-striped table-hover table-sm mb-0">
                                            <thead style="position: sticky; top: 0; background: white; z-index: 1;">
                                                <tr>
                                                    <th>Name <i class='bx bx-up-arrow-alt ms-2'></i></th>
                                                    <th>Last Modified</th>
                                                    <th>File Path</th>
                                                    <th>File Size</th>
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
                                                        <td style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" 
                                                            title="${file.path}">
                                                            ${file.path}
                                                        </td>
                                                        <td>${file.size}</td>
                                                        <td><a style="cursor: pointer" onclick="deleteImage('${file.name}')"><i class='bx bx-trash font-24'></i></a></td>
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

            <!--modal up ảnh-->
            <div id="uploadModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1050;">
                <div style="position: relative; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border-radius: 5px; width: 400px; max-width: 90%;">
                    <form method="post" action="file_manager" enctype="multipart/form-data">
                        <h5 style="margin-bottom: 15px;">Upload Image</h5>
                        <select style="width: 200px; height: 30px ; margin-bottom: 10px" name="folder">
                            <option value="images">Images</option>
                            <option value="thumb">Thumbnail</option>
                        </select>
                        <!-- Input file chỉ để chọn, không upload -->
                        <input name="file" type="file" id="fileInput" accept=".jpg,.png,.jpeg,.webp" style="display: block; margin-bottom: 10px;" onchange="document.getElementById('fileName').innerText = this.files[0] ? this.files[0].name : 'No file selected';">
                        <span id="fileName" style="display: block; margin-bottom: 15px;">No file selected</span>

                        <!-- Nút Submit và Đóng -->
                        <div style="text-align: right;">
                            <button type="submit" id="btnSubmitUpload" style="padding: 6px 12px; color: #fff; background-color: rgb(34,139,34); border: none; border-radius: 4px; cursor: pointer; margin-right: 10px;">Submit</button>
                            <button type="button" style="padding: 6px 12px; color: #fff; background-color: #6c757d; border: none; border-radius: 4px; cursor: pointer;" onclick="document.getElementById('uploadModal').style.display = 'none';">Close</button>
                        </div>
                    </form>
                </div>
            </div>
            <!--end modal-->
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
            <script>
                function submitFile(event) {
                    const fileInput = document.getElementById('fileInput');

                    if (fileInput.files.length === 0) {
                        event.preventDefault();
                        alert('Please select a file first!');
                        return;
                    }

                    const file = fileInput.files[0];
                    const fileName = file.name.toLowerCase();

                    if (!(fileName.endsWith('.jpg') ||
                            fileName.endsWith('.jpeg') ||
                            fileName.endsWith('.png') ||
                            fileName.endsWith('.webp'))) {
                        event.preventDefault();
                        alert('Invalid file type! Only .jpg, .jpeg, .png, and .webp are allowed.');
                        return;
                    }

                    alert('File ready to upload: ' + file.name);

                    document.getElementById('uploadModal').style.display = 'none';
                }
            </script>

            <script>
                function deleteImage(imagename) {
                    var search = new URLSearchParams(window.location.search);
                    var searchtype = search.get("folder");
                    if (searchtype === null) {
                        searchtype = "images";
                    }

                    
                    if (confirm("Bạn chắc chắn muốn xóa " + imagename + " ở folder " + searchtype + " ?")) {
                        var url = "delete_image?name=" + encodeURIComponent(imagename) + "&folder=" + encodeURIComponent(searchtype);
                        window.location.href = url; // Redirect tới Servlet
                    }
                }
            </script>
            <jsp:include page="Common/Message.jsp"/>
            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
