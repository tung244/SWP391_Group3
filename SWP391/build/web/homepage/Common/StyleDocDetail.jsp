<%-- 
    Document   : StyleDocDetail
    Created on : Feb 6, 2025, 4:06:55 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style>
            .doctor-details-area {
                padding: 80px 0;
                background: #f8f9fa;
            }

            .doctor-details {
                border: 1px solid #e9ecef;
            }

            .doctor-thumb img {
                width: 200px;
                height: 200px;
                object-fit: cover;
                border: 3px solid #28a745;
            }

            .star-rating {
                color: #ffc107;
                font-size: 18px;
            }

            .doctor-actions .btn {
                padding: 10px 30px;
            }
            .doctor-social {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                background: rgba(255,255,255,0.9);
                padding: 10px;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .doctor-card:hover .doctor-social {
                opacity: 1;
            }

            .doctor-social a {
                margin: 0 10px;
            }

            .star-rating.small {
                font-size: 14px;
            }
            .doctor-details-area {
                padding: 60px 0;
                background: #f8f9fa;
            }

            .doctor-details {
                border: 1px solid #e9ecef;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            }

            .doctor-thumb {
                padding: 20px;
                background: #fff;
                border-radius: 10px;
            }

            .doctor-thumb img {
                width: 200px;
                height: 200px;
                object-fit: cover;
                border: 4px solid #28a745;
                margin-bottom: 20px;
            }

            .star-rating {
                background: #f8f9fa;
                padding: 10px;
                border-radius: 5px;
                margin-top: 15px;
            }

            .doctor-info {
                padding: 20px 0;
            }

            .doctor-info h2 {
                font-size: 32px;
                margin-bottom: 20px;
                border-bottom: 2px solid #28a745;
                padding-bottom: 10px;
            }

            .doctor-info h4 {
                color: #666;
                margin-bottom: 30px;
            }

            .doctor-bio {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                margin: 30px 0;
            }

            .list-unstyled li {
                padding: 10px 0;
                border-bottom: 1px solid #eee;
            }

            .doctor-actions {
                margin-top: 40px;
                padding: 20px;
                background: #f8f9fa;
                border-radius: 8px;
            }

            .btn-success {
                padding: 12px 30px;
                font-size: 16px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            </style>
    </head>
   
</html>
