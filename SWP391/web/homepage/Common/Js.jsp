

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <body>
        <!--        button messenger-->
        <a href="https://m.me/596933063493069" target="_blank" class="messenger-icon">
            <img src="homepage/images/icon/logo_messenger.webp" alt="Messenger">
        </a>

        <!--support-->

        <div class="custom-support-wrapper">
            <button class="custom-support-btn">
                <i class="bx bx-support"></i>
            </button>

            <div class="custom-support-modal">
                <div class="custom-support-modal-content">
                    <button class="custom-support-close-btn">
                        <i class="bx bx-x"></i>
                    </button>
                    <h2 class="custom-support-title">Yêu cầu hỗ trợ</h2>
                    <form action="support" method="post">
                        <div class="custom-support-form-group">
                            <label for="supportName">
                                <i class="bx bx-user"></i>
                                Họ và tên
                            </label>
                            <input type="text" name="supportName" id="supportName" required>
                        </div>
                        <div class="custom-support-form-group">
                            <label for="supportContact">
                                <i class="bx bx-envelope"></i>
                                Email hoặc số điện thoại
                            </label>
                            <input type="text" name="supportContact" id="supportContact" required>
                        </div>
                        <div class="custom-support-form-group">
                            <label for="supportMessage">
                                <i class="bx bx-message-detail"></i>
                                Nội dung cần hỗ trợ
                            </label>
                            <textarea name="supportMessage" id="supportMessage" required></textarea>
                        </div>
                        <button type="submit" class="custom-support-submit-btn">
                            <i class="bx bx-send"></i>
                            Gửi yêu cầu
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            const supportBtn = document.querySelector(".custom-support-btn");
            const modal = document.querySelector(".custom-support-modal");
            const closeBtn = document.querySelector(".custom-support-close-btn");
            const supportForm = document.getElementById("customSupportForm");

            supportBtn.addEventListener("click", () => {
                modal.classList.add("active");
            });

            closeBtn.addEventListener("click", () => {
                modal.classList.remove("active");
            });

            modal.addEventListener("click", (e) => {
                if (e.target === modal) {
                    modal.classList.remove("active");
                }
            });

            supportForm.addEventListener("submit", (e) => {
                e.preventDefault();
                const formData = {
                    name: document.getElementById("supportName").value,
                    contact: document.getElementById("supportContact").value,
                    message: document.getElementById("supportMessage").value
                };

                console.log("Form submitted:", formData);

                supportForm.reset();
                modal.classList.remove("active");

                alert("Yêu cầu hỗ trợ đã được gửi thành công!");
            });
        </script>

        <!--        javascript-->
        <script src="homepage/js/script.js"></script>
        <script src="homepage/js/jquery.js"></script>
        <!-- Wow Script -->
        <script src="homepage/js/wow.min.js"></script>
        <!-- bootstrap -->
        <script src="homepage/js/bootstrap.min.js"></script>
        <!-- bx slider -->
        <script src="homepage/js/jquery.bxslider.min.js"></script>
        <!-- count to -->
        <script src="homepage/js/jquery.countTo.js"></script>
        <!-- owl carousel -->
        <script src="homepage/js/owl.carousel.min.js"></script>
        <!-- validate -->
        <script src="homepage/js/validation.js"></script>
        <!-- mixit up -->
        <script src="homepage/js/jquery.mixitup.min.js"></script>
        <!-- easing -->
        <script src="homepage/js/jquery.easing.min.js"></script>
        <!-- gmap helper -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHzPSV2jshbjI8fqnC_C4L08ffnj5EN3A"></script>
        <!--gmap script-->
        <script src="homepage/js/gmaps.js"></script>
        <script src="homepage/js/map-helper.js"></script>
        <!-- video responsive script -->
        <script src="homepage/js/jquery.fitvids.js"></script>
        <!-- jQuery ui js -->
        <script src="homepage/assets/jquery-ui-1.11.4/jquery-ui.js"></script>
        <!-- Language Switche  -->
        <script src="homepage/assets/language-switcher/jquery.polyglot.language.switcher.js"></script>
        <!-- fancy box -->
        <script src="homepage/js/jquery.fancybox.pack.js"></script>
        <script src="homepage/js/jquery.appear.js"></script>
        <!-- isotope script-->
        <script src="homepage/js/isotope.js"></script>
        <script src="homepage/js/jquery.prettyPhoto.js"></script> 
        <!-- jQuery timepicker js -->
        <script src="homepage/assets/timepicker/timePicker.js"></script>
        <!-- Bootstrap select picker js -->
        <script src="homepage/assets/bootstrap-sl-1.12.1/bootstrap-select.js"></script>                               


        <!-- revolution slider js -->
        <script src="homepage/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="homepage/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="homepage/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>



        <!-- thm custom script -->
        <script src="homepage/js/custom.js"></script>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Eyecare"
        agent-id="a8482afe-7d06-4eed-974b-324f8f63ea2e"
        language-code="vi"
        ></df-messenger>
</body>
</html>
