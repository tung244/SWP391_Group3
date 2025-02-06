document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.menu-item');
    const submenus = document.querySelectorAll('.submenu');
    const mobileTrigger = document.querySelector('.mobile-trigger');
    const menuLeft = document.querySelector('.menu-left');
    const loading = document.querySelector('.loading');

    // Ẩn loading sau khi tải xong
    setTimeout(() => {
        loading.style.display = 'none';
    }, 500);

    // Toggle menu mobile
    mobileTrigger?.addEventListener('click', () => {
        menuLeft.classList.toggle('active');
    });

    // Xử lý hover & click
    menuItems.forEach(item => {
        const handleActivation = (event) => {
            const targetId = item.getAttribute('data-target');
            const targetSubmenu = document.getElementById(targetId);

            // Ẩn tất cả submenu
            menuItems.forEach(mi => mi.classList.remove('active'));
            submenus.forEach(submenu => submenu.classList.remove('active'));

            // Hiện submenu tương ứng
            item.classList.add('active');
            if (targetSubmenu) {
                targetSubmenu.classList.add('active');
            }
        };

        item.addEventListener('mouseenter', handleActivation);
        item.addEventListener('touchstart', handleActivation);
    });

    // Ẩn menu khi click ra ngoài (mobile)
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.mega-menu') && window.innerWidth <= 768) {
            menuLeft?.classList.remove('active');
        }
    });

    // Reset khi resize màn hình
    window.addEventListener('resize', () => {
        if (window.innerWidth > 768) {
            menuLeft?.classList.remove('active');
        }
    });
});
