// Redirect the user to the search page
function handleNavigationEvent(details, queryEngine, systemEngine) {
    const url = new URL(details.url)
    let query

    if (systemEngine.name === "Yahoo") {
        query = url.searchParams.get('p').replace(/ /g, '+')
    } else {
        query = url.searchParams.get('q').replace(/ /g, '+')
    }

    if (query) {
        browser.tabs.update({ url: queryEngine.url.replace("%s", query) });
    }
}

// Fetch UserDefaults first before redirect
function getUserDefaults(details) {
    browser.runtime.sendNativeMessage("application.id", function(response) {
        if (details.url.startsWith(response.systemEngine.url)) {
            if (!response.disabled) {
                handleNavigationEvent(details, response.queryEngine, response.systemEngine)
            }
        }
    })
}

browser.webNavigation.onBeforeNavigate.addListener(getUserDefaults);
