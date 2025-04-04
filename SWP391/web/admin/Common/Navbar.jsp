<%-- 
    Document   : Navbar
    Created on : Feb 17, 2025, 3:57:55 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header" >
        <div class="">
            <img src="assets/images/logoicon.png" class="logo-icon-2" alt=""  />
        </div>
        <div>
            <h4 class="logo-text">Dashboard</h4>
        </div>
        <a href="javascript:;" class="toggle-btn ms-auto"> <i class="bx bx-menu"></i>
        </a>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">

        <c:forEach var="menu" items="${menu}">
            <li>
                <a class="has-arrow" href="javascript:;">
                    <div class="parent-icon icon-color-10"><i class="${menu.key.module_img}"></i>
                    </div>
                    <div class="menu-title">${menu.key.module_name}</div>
                </a>
                <ul>
                    <c:forEach var="entry" items="${menu.value}">
                        <li> <a href="..${entry.permission_path}"><i class="bx bx-right-arrow-alt"></i>${entry.permission_name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>


    </ul>
    <!--end navigation-->
</div>
<!--end sidebar-wrapper-->
<!--header-->
<header class="top-header">
    <nav class="navbar navbar-expand">
        <div class="left-topbar d-flex align-items-center">
            <a href="javascript:;" class="toggle-btn">	<i class="bx bx-menu"></i>
            </a>
        </div>
        <div class="flex-grow-1 search-bar">
            <div class="input-group">
                <button class="btn btn-search-back search-arrow-back" type="button"><i class="bx bx-arrow-back"></i></button>
                <form action="searchService" method="post" style="display: flex; width: 100%; align-items: center;">
                    <input type="text" class="form-control" name="name" placeholder="search" style="flex: 1; margin-right: 10px;"  value="${not empty Name ? Name : ''}"                                                        }"/>
                    <button class="btn btn-search" type="submit"><i class="lni lni-search-alt"></i></button>
                </form>


            </div>
        </div>
        <div class="right-topbar ms-auto">
            <ul class="navbar-nav">
                <li class="nav-item search-btn-mobile">
                    <a class="nav-link position-relative" href="javascript:;">	<i class="bx bx-search vertical-align-middle"></i>
                    </a>
                </li>
                
                
                <li class="nav-item dropdown dropdown-user-profile">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;" data-bs-toggle="dropdown">
                        <div class="d-flex user-box align-items-center">
                            <div class="user-info">
                                <c:if test="${sessionScope.account.role.role_id !=3}">
                                    <p class="user-name mb-0">${sessionScope.profile.admin_fullname}</p>
                                </c:if>
                                <c:if test="${sessionScope.account.role.role_id ==3}">
                                    <p class="user-name mb-0">${sessionScope.profile.doctor_name}</p>
                                </c:if>
                                <p class="designattion mb-0">Online</p>
                            </div>
                            
                            <c:if test="${sessionScope.account.role.role_id !=3}">
                                <img src="${sessionScope.profile.image_profile_admin}" class="user-img" alt="user avatar">
                                </c:if>
                                <c:if test="${sessionScope.account.role.role_id ==3}">
                                    <img src="${sessionScope.profile.profile_image}" class="user-img" alt="user avatar">
                                </c:if>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">	
                        
                        <div class="dropdown-divider mb-0"></div>	<a class="dropdown-item" href="dang_xuat"><i
                                class="bx bx-power-off"></i><span>Logout</span></a>
                    </div>
                </li>
                
            </ul>
        </div>
    </nav>
</header>

