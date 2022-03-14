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
    if (details.url.startsWith("https://ecosia.org/search") || details.url.startsWith("https://www.ecosia.org/search")) {
        browser.runtime.sendNativeMessage("application.id", function(response) {
            handleNavigationEvent(details, response.queryUrl)
        })
    }
}

browser.webNavigation.onBeforeNavigate.addListener(getUserDefaults);
