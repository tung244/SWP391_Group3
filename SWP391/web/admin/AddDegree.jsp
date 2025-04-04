

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <jsp:include page="Common/Navbar.jsp"/>    
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Forms</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="doctorProfile?accId=${accId}">Doctor Profile</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Degree</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">


                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Add Degree</h5>                   
                                        </div>
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger" role="alert">
                                                ${errorMessage}
                                            </div>
                                        </c:if>
                                        <%
                                         session.removeAttribute("errorMessage");       
                                        %>
                                        <hr>                                    
                                        <form action="addDegree" method="POST" class="row g-3" enctype="multipart/form-data">                                          
                                            <div id="degreeFields">
                                                <input type="hidden" name="did" value="${did}"/>
                                                <!-- First degree entry -->
                                                <div class="col-12 degree-entry mb-3">
                                                    <div class="mb-2">
                                                        <label class="form-label">Degree Name</label>
                                                        <select name="degreeName[]" class="form-control" required>
                                                            <option value="" selected disabled>Select a degree</option>
                                                            <c:forEach items="${listDe}" var="lde">
                                                                <option value="${lde.degree_id}">${lde.degree_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label class="form-label">Degree Image</label>
                                                        <input accept=".jpg, .jpeg, .webp, .png" type="file" name="degreeImage[]" class="form-control" required>
                                                    </div>

                                                    <div class="mt-2">
                                                        <label class="form-label">Issued By</label>
                                                        <input type="text" name="issuedBy[]" class="form-control" placeholder="Institution that issued the degree" required>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button   type="button" class="btn btn-secondary px-5 me-2" onclick="addDegreeField()">Add More</button>
                                                <button  type="submit" class="btn btn-success px-5">CREATE</button>
                                                <a href="doctorProfile?accId=${accId}" class="btn btn-danger px-5 me-2">CANCEL</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!--end row-->

                                <!--end row-->
                            </div>
                        </div>
                        <!--end page-content-wrapper-->
                    </div>

                    <!--end page-wrapper-->
                    <!--start overlay-->
                    <div class="overlay toggle-btn-mobile"></div>
                    <!--end overlay-->
                    <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
                    <!--End Back To Top Button-->
                    <!--footer -->
                    <div class="footer">
                        <p class="mb-0">Syndash @2020 | Developed By : <a href="https://themeforest.net/user/codervent" target="_blank">codervent</a>
                        </p>
                    </div>
                    <!-- end footer -->
                </div>
                <!-- end wrapper -->

                <!-- JavaScript -->
                <!-- Bootstrap JS -->
                <script src="../admin/assets/js/bootstrap.bundle.min.js"></script>

                <!--plugins-->
                <script src="../admin/assets/js/jquery.min.js"></script>
                <script src="../admin/assets/plugins/simplebar/js/simplebar.min.js"></script>
                <script src="../admin/assets/plugins/metismenu/js/metisMenu.min.js"></script>
                <script src="../admin/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>

                <!-- App JS -->
                <script src="../admin/assets/js/app.js"></script>

                <!-- JavaScript -->

                <script>
                                                    function addDegreeField() {
                                                        // Get the original select element
                                                        let originalSelect = document.querySelector('#degreeFields select');

                                                        // Create a copy of the select element with all its options
                                                        let selectClone = originalSelect.cloneNode(true);
                                                        selectClone.name = "degreeName[]";

                                                        // Create new degree entry
                                                        let container = document.getElementById("degreeFields");
                                                        let newField = document.createElement("div");
                                                        newField.classList.add("col-12", "degree-entry", "mb-3");

                                                        // Create the wrapper for the select
                                                        let selectWrapper = document.createElement("div");
                                                        selectWrapper.classList.add("mb-2");

                                                        // Add label to the wrapper
                                                        let label = document.createElement("label");
                                                        label.classList.add("form-label");
                                                        label.textContent = "Degree Name";
                                                        selectWrapper.appendChild(label);

                                                        // Add the cloned select to the wrapper
                                                        selectWrapper.appendChild(selectClone);

                                                        // Add the wrapper to the new field
                                                        newField.appendChild(selectWrapper);

                                                        // Create the file input section
                                                        let fileSection = document.createElement("div");
                                                        let fileLabel = document.createElement("label");
                                                        fileLabel.classList.add("form-label");
                                                        fileLabel.textContent = "Degree Image";
                                                        fileSection.appendChild(fileLabel);

                                                        let fileInput = document.createElement("input");
                                                        fileInput.type = "file";
                                                        fileInput.name = "degreeImage[]";
                                                        fileInput.classList.add("form-control");
                                                        fileSection.appendChild(fileInput);

                                                        newField.appendChild(fileSection);

                                                        // Create the issued by section
                                                        let issuedBySection = document.createElement("div");
                                                        issuedBySection.classList.add("mt-2");

                                                        let issuedByLabel = document.createElement("label");
                                                        issuedByLabel.classList.add("form-label");
                                                        issuedByLabel.textContent = "Issued By";
                                                        issuedBySection.appendChild(issuedByLabel);

                                                        let issuedByInput = document.createElement("input");
                                                        issuedByInput.type = "text";
                                                        issuedByInput.name = "issuedBy[]";
                                                        issuedByInput.classList.add("form-control");
                                                        issuedByInput.placeholder = "Institution that issued the degree";
                                                        issuedBySection.appendChild(issuedByInput);

                                                        newField.appendChild(issuedBySection);

                                                        // Add remove button
                                                        let removeButtonDiv = document.createElement("div");
                                                        removeButtonDiv.classList.add("mt-2");

                                                        let removeButton = document.createElement("button");
                                                        removeButton.type = "button";
                                                        removeButton.classList.add("btn", "btn-danger", "btn-sm");
                                                        removeButton.textContent = "Remove";
                                                        removeButton.onclick = function () {
                                                            removeDegreeField(this);
                                                        };
                                                        removeButtonDiv.appendChild(removeButton);

                                                        newField.appendChild(removeButtonDiv);

                                                        // Add the complete new field to the container
                                                        container.appendChild(newField);
                                                    }

                                                    function removeDegreeField(button) {
                                                        // Get the parent degree-entry div and remove it
                                                        const entryDiv = button.closest('.degree-entry');
                                                        entryDiv.remove();
                                                    }
                </script>
                </body>

                </html>
