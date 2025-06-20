// ... existing code ...
// Remove AJAX NASA Data Refresh and updateCelestialSection logic
// Keep only saved events and tooltip initialization
// ... existing code ...

document.addEventListener('DOMContentLoaded', function() {
    // Sidebar logic
    const starTrigger = document.getElementById('star-sidebar-trigger');
    const sidebar = document.getElementById('saved-events-sidebar');
    const closeSidebarBtn = document.getElementById('close-sidebar');
    if (starTrigger && sidebar) {
        let sidebarTimeout;
        // Open sidebar on hover or click
        starTrigger.addEventListener('mouseenter', function() {
            clearTimeout(sidebarTimeout);
            sidebar.classList.add('active');
        });
        starTrigger.addEventListener('click', function() {
            sidebar.classList.add('active');
        });
        // Close sidebar on mouseleave (with delay for user to move mouse)
        sidebar.addEventListener('mouseleave', function() {
            sidebarTimeout = setTimeout(() => sidebar.classList.remove('active'), 200);
        });
        sidebar.addEventListener('mouseenter', function() {
            clearTimeout(sidebarTimeout);
        });
        // Close sidebar on close button
        if (closeSidebarBtn) {
            closeSidebarBtn.addEventListener('click', function() {
                sidebar.classList.remove('active');
            });
        }
        // Also close sidebar if user clicks outside
        document.addEventListener('mousedown', function(e) {
            if (sidebar.classList.contains('active') && !sidebar.contains(e.target) && !starTrigger.contains(e.target)) {
                sidebar.classList.remove('active');
            }
        });
    }
    // Tooltip for non-logged-in users
    if (starTrigger && !sidebar) {
        if (window.bootstrap) {
            new bootstrap.Tooltip(starTrigger);
        }
    }

    // --- AJAX Event Saving ---
    document.querySelectorAll('.save-event-btn').forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const url = btn.getAttribute('href');
            fetch(url, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': getCSRFToken(),
                },
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('✅ Event Saved!');
                    updateSavedEventsSidebar(data.saved_events_html);
                } else if (data.redirect_url) {
                    window.location.href = data.redirect_url;
                } else {
                    showToast('❌ Could not save event.');
                }
            })
            .catch(() => showToast('❌ Could not save event.'));
        });
    });

    // --- Persistent Location ---
    const cityInput = document.getElementById('city-input');
    if (cityInput) {
        // On city input change, store in localStorage
        cityInput.addEventListener('change', function() {
            localStorage.setItem('astrobuddy_city', cityInput.value);
        });
    }
    // On page load, restore city from localStorage
    const storedCity = localStorage.getItem('astrobuddy_city');
    if (storedCity && cityInput) {
        cityInput.value = storedCity;
        // Optionally, trigger a reload of events/weather for this city
        // window.location.search = '?city=' + encodeURIComponent(storedCity);
    }
    // Optional: Reset Location button
    const resetBtn = document.getElementById('reset-location-btn');
    if (resetBtn) {
        resetBtn.addEventListener('click', function() {
            localStorage.removeItem('astrobuddy_city');
            window.location.href = '/dashboard/'; // Redirect to clear the view
        });
    }
});

function getCSRFToken() {
    const name = 'csrftoken';
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        let c = cookies[i].trim();
        if (c.startsWith(name + '=')) {
            return c.substring(name.length + 1, c.length);
        }
    }
    return '';
}

function showToast(msg) {
    // Simple toast/alert (replace with AstroBuddy toast if needed)
    alert(msg);
}

function updateSavedEventsSidebar(html) {
    const sidebar = document.getElementById('sidebar-events-list');
    if (sidebar) sidebar.innerHTML = html;
}
// ... existing code ... 