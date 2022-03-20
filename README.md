
# SearchPlus

Expand the range of Safari search engines.

## Download on TestFlight

[https://testflight.apple.com/join/Y4NZzwfY](https://testflight.apple.com/join/Y4NZzwfY)

## Why did I make this?

Following the recent search engine controversies, I created a SearX insteance. However, Safari doesn't allow users to add and select custom search engines for the URL bar. This a problem both on the macOS and iOS versions of Safari.

This extension helps expand the bounds of search engines for users to select from a predefined list or input a custom query URL for searching directly in the URL bar.

## Why not use other extensions?

Other extensions do exist to change the default safari search engine, usually to override it. The main issue is that toggling the option overrides all requests to any of the five search engines in Safari settings.

For example, I turn on the toggle in this extension and try to search something on DuckDuckGo (with my default search engine being Google). The search on the DDG website will redirect me to my custom search engine!

Even though my default search engine is Google, the extension is overriding ALL of my search requests to DDG even if I want to force searches there. This made me increasingly frustrated.

SearchPlus is different since it only overrides the search engine of the user's choosing, which allows the user to manually use a different search engine in addition to not overriding every default Safari search engine.

## Initial Setup

When you open the app for the first time, you will see a configuration section. If you use Google as your default Safari search engine and want to override it with StartPage, just close out of the app.

Otherwise:
1.  Set your Safari default search engine in the `Safari default engine` picker.
2. Set your new default search engine in the `Suggested Search Engines` section.
3. If you set the new search engine to `Custom`, enter the query URL in the `Current query URL` box with the scheme `https://searchengine.com/search?q=%s` where `%s` is where the query is substituted in.
4. Enable the SearchPlus extension in iOS/macOS settings or in Safari itself
5. Navigate to your default search engine website and allow the extension on that website or all websites if you want (You can also configure this directly in iOS/macOS settings)
6. Searching should work!


## Planned features

Here are features that I have planned for future releases (these are also in the issues)

- Onboarding: A pretty screen for users to select the safari default search engine and redirect search engine

## Building from source

If you have Xcode, you can build SearchPlus from source and run it on your device.

The only branch in the repository is `default` because this is a small project.

Xcode builds are ran at your own risk and are not guaranteed to get support in the event of an app crash!

## Contribution

If you have issues with the app:

- Describe the issue in detail
- If you have a feature request, please indicate it as so. Planned features are in a different section of the README, so be sure to read those before submitting.

# Developers and Permissions

I try to make comments/commits as detailed as possible, but if you don't understand something, please contact me via Discord or Twitter! I'm always happy to talk!

Creator/Developer: Brian Dashore

Developer Website: [kingbri.dev](https://kingbri.dev)

Developer Discord: kingbri#6666

Join the support discord here (get the king-updates role to access the channel): [https://discord.gg/pswt7by](https://discord.gg/pswt7by)
