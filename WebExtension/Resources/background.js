// Redirect the user to the search page
function handleNavigationEvent(details, queryUrl) {
    const url = new URL(details.url)
    const query = url.searchParams.get('q').replace(/ /g, '+')

    if (query) {
        browser.tabs.update({url: queryUrl.replace("%s", query)});
    }
}

// Fetch UserDefaults first before redirect
function getUserDefaults(details) {
    browser.runtime.sendNativeMessage("application.id", function(response) {
        if (details.url.startsWith(response.systemUrl)) {
            if (!response.disabled) {
                handleNavigationEvent(details, response.queryUrl)
            }
        }
    })
}

browser.webNavigation.onBeforeNavigate.addListener(getUserDefaults);
