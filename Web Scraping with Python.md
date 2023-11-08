# Web Scraping Real Data From Wikipedia Page + Pandas Project


### Importing BeautifulSoup and requests packages


```python
from bs4 import BeautifulSoup
import requests
```

### Specifying URL to scrap data from


```python
url = 'https://en.wikipedia.org/wiki/List_of_largest_companies_in_the_United_States_by_revenue'
```

### Using requests to get URL into session


```python
page = requests.get(url)
```

### Getting HTML from page and assigning it variable 'soup'


```python
soup = BeautifulSoup(page.text, 'html')
```


```python
print(soup).prettify
```

    <!DOCTYPE html>
    <html class="client-nojs vector-feature-language-in-header-enabled vector-feature-language-in-main-page-header-disabled vector-feature-sticky-header-disabled vector-feature-page-tools-pinned-disabled vector-feature-toc-pinned-clientpref-1 vector-feature-main-menu-pinned-disabled vector-feature-limited-width-clientpref-1 vector-feature-limited-width-content-enabled vector-feature-zebra-design-disabled vector-feature-custom-font-size-clientpref-0 vector-feature-client-preferences-disabled vector-feature-typography-survey-disabled vector-toc-available" dir="ltr" lang="en">
    <head>
    <meta charset="utf-8"/>
    <title>List of largest companies in the United States by revenue - Wikipedia</title>
    <script>(function(){var className="client-js vector-feature-language-in-header-enabled vector-feature-language-in-main-page-header-disabled vector-feature-sticky-header-disabled vector-feature-page-tools-pinned-disabled vector-feature-toc-pinned-clientpref-1 vector-feature-main-menu-pinned-disabled vector-feature-limited-width-clientpref-1 vector-feature-limited-width-content-enabled vector-feature-zebra-design-disabled vector-feature-custom-font-size-clientpref-0 vector-feature-client-preferences-disabled vector-feature-typography-survey-disabled vector-toc-available";var cookie=document.cookie.match(/(?:^|; )enwikimwclientpreferences=([^;]+)/);if(cookie){cookie[1].split('%2C').forEach(function(pref){className=className.replace(new RegExp('(^| )'+pref.replace(/-clientpref-\w+$|[^\w-]+/g,'')+'-clientpref-\\w+( |$)'),'$1'+pref+'$2');});}document.documentElement.className=className;}());RLCONF={"wgBreakFrames":false,"wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],
    "wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgRequestId":"199e1a0c-57c3-4d97-bd1b-c77e820524e8","wgCanonicalNamespace":"","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":0,"wgPageName":"List_of_largest_companies_in_the_United_States_by_revenue","wgTitle":"List of largest companies in the United States by revenue","wgCurRevisionId":1183367931,"wgRevisionId":1183367931,"wgArticleId":61181662,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":null,"wgUserGroups":["*"],"wgCategories":["Articles with short description","Short description is different from Wikidata","Articles needing additional references from June 2020","All articles needing additional references","Economy of the United States-related lists","Lists of companies by revenue","Lists of largest private companies by country","Lists of companies of the United States"],"wgPageViewLanguage":
    "en","wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgRelevantPageName":"List_of_largest_companies_in_the_United_States_by_revenue","wgRelevantArticleId":61181662,"wgIsProbablyEditable":true,"wgRelevantPageIsProbablyEditable":true,"wgRestrictionEdit":[],"wgRestrictionMove":[],"wgNoticeProject":"wikipedia","wgFlaggedRevsParams":{"tags":{"status":{"levels":1}}},"wgMediaViewerOnClick":true,"wgMediaViewerEnabledByDefault":true,"wgPopupsFlags":10,"wgVisualEditor":{"pageLanguageCode":"en","pageLanguageDir":"ltr","pageVariantFallbacks":"en"},"wgMFDisplayWikibaseDescriptions":{"search":true,"watchlist":true,"tagline":false,"nearby":true},"wgWMESchemaEditAttemptStepOversample":false,"wgWMEPageLength":30000,"wgULSCurrentAutonym":"English","wgCentralAuthMobileDomain":false,"wgEditSubmitButtonLabelPublish":true,"wgULSPosition":"interlanguage","wgULSisCompactLinksEnabled":true,"wgULSisLanguageSelectorEmpty":false,"wgWikibaseItemId":"Q1860802","wgCheckUserClientHintsHeadersJsApi":[
    "architecture","bitness","brands","fullVersionList","mobile","model","platform","platformVersion"],"GEHomepageSuggestedEditsEnableTopics":true,"wgGETopicsMatchModeEnabled":false,"wgGEStructuredTaskRejectionReasonTextInputEnabled":false,"wgGELevelingUpEnabledForUser":false};RLSTATE={"skins.vector.user.styles":"ready","ext.globalCssJs.user.styles":"ready","site.styles":"ready","user.styles":"ready","skins.vector.user":"ready","ext.globalCssJs.user":"ready","user":"ready","user.options":"loading","ext.cite.styles":"ready","codex-search-styles":"ready","skins.vector.styles":"ready","skins.vector.icons":"ready","jquery.tablesorter.styles":"ready","ext.visualEditor.desktopArticleTarget.noscript":"ready","ext.uls.interlanguage":"ready","wikibase.client.init":"ready","ext.wikimediaBadges":"ready"};RLPAGEMODULES=["ext.cite.ux-enhancements","site","mediawiki.page.ready","jquery.tablesorter","mediawiki.toc","skins.vector.js","ext.centralNotice.geoIP","ext.centralNotice.startUp",
    "ext.gadget.ReferenceTooltips","ext.gadget.switcher","ext.urlShortener.toolbar","ext.centralauth.centralautologin","mmv.head","mmv.bootstrap.autostart","ext.popups","ext.visualEditor.desktopArticleTarget.init","ext.visualEditor.targetLoader","ext.echo.centralauth","ext.eventLogging","ext.wikimediaEvents","ext.navigationTiming","ext.uls.compactlinks","ext.uls.interface","ext.cx.eventlogging.campaigns","ext.cx.uls.quick.actions","wikibase.client.vector-2022","ext.checkUser.clientHints","ext.growthExperiments.SuggestedEditSession"];</script>
    <script>(RLQ=window.RLQ||[]).push(function(){mw.loader.impl(function(){return["user.options@12s5i",function($,jQuery,require,module){mw.user.tokens.set({"patrolToken":"+\\","watchToken":"+\\","csrfToken":"+\\"});
    }];});});</script>
    <link href="/w/load.php?lang=en&amp;modules=codex-search-styles%7Cext.cite.styles%7Cext.uls.interlanguage%7Cext.visualEditor.desktopArticleTarget.noscript%7Cext.wikimediaBadges%7Cjquery.tablesorter.styles%7Cskins.vector.icons%2Cstyles%7Cwikibase.client.init&amp;only=styles&amp;skin=vector-2022" rel="stylesheet"/>
    <script async="" src="/w/load.php?lang=en&amp;modules=startup&amp;only=scripts&amp;raw=1&amp;skin=vector-2022"></script>
    <meta content="" name="ResourceLoaderDynamicStyles"/>
    <link href="/w/load.php?lang=en&amp;modules=site.styles&amp;only=styles&amp;skin=vector-2022" rel="stylesheet"/>
    <meta content="MediaWiki 1.42.0-wmf.3" name="generator"/>
    <meta content="origin" name="referrer"/>
    <meta content="origin-when-cross-origin" name="referrer"/>
    <meta content="max-image-preview:standard" name="robots"/>
    <meta content="telephone=no" name="format-detection"/>
    <meta content="width=1000" name="viewport"/>
    <meta content="List of largest companies in the United States by revenue - Wikipedia" property="og:title"/>
    <meta content="website" property="og:type"/>
    <link href="//upload.wikimedia.org" rel="preconnect"/>
    <link href="//en.m.wikipedia.org/wiki/List_of_largest_companies_in_the_United_States_by_revenue" media="only screen and (max-width: 720px)" rel="alternate"/>
    <link href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit" rel="alternate" title="Edit this page" type="application/x-wiki"/>
    <link href="/static/apple-touch/wikipedia.png" rel="apple-touch-icon"/>
    <link href="/static/favicon/wikipedia.ico" rel="icon"/>
    <link href="/w/opensearch_desc.php" rel="search" title="Wikipedia (en)" type="application/opensearchdescription+xml"/>
    <link href="//en.wikipedia.org/w/api.php?action=rsd" rel="EditURI" type="application/rsd+xml"/>
    <link href="https://en.wikipedia.org/wiki/List_of_largest_companies_in_the_United_States_by_revenue" rel="canonical"/>
    <link href="https://creativecommons.org/licenses/by-sa/4.0/deed.en" rel="license"/>
    <link href="/w/index.php?title=Special:RecentChanges&amp;feed=atom" rel="alternate" title="Wikipedia Atom feed" type="application/atom+xml"/>
    <link href="//meta.wikimedia.org" rel="dns-prefetch"/>
    <link href="//login.wikimedia.org" rel="dns-prefetch"/>
    </head>
    <body class="skin-vector skin-vector-search-vue mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-subject mw-editable page-List_of_largest_companies_in_the_United_States_by_revenue rootpage-List_of_largest_companies_in_the_United_States_by_revenue skin-vector-2022 action-view"><a class="mw-jump-link" href="#bodyContent">Jump to content</a>
    <div class="vector-header-container">
    <header class="vector-header mw-header">
    <div class="vector-header-start">
    <nav aria-label="Site" class="vector-main-menu-landmark" role="navigation">
    <div class="vector-dropdown vector-main-menu-dropdown vector-button-flush-left vector-button-flush-right" id="vector-main-menu-dropdown">
    <input aria-haspopup="true" aria-label="Main menu" class="vector-dropdown-checkbox" data-event-name="ui.dropdown-vector-main-menu-dropdown" id="vector-main-menu-dropdown-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet cdx-button--icon-only" for="vector-main-menu-dropdown-checkbox" id="vector-main-menu-dropdown-label"><span class="vector-icon mw-ui-icon-menu mw-ui-icon-wikimedia-menu"></span>
    <span class="vector-dropdown-label-text">Main menu</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-unpinned-container" id="vector-main-menu-unpinned-container">
    <div class="vector-main-menu vector-pinnable-element" id="vector-main-menu">
    <div class="vector-pinnable-header vector-main-menu-pinnable-header vector-pinnable-header-unpinned" data-feature-name="main-menu-pinned" data-pinnable-element-id="vector-main-menu" data-pinned-container-id="vector-main-menu-pinned-container" data-unpinned-container-id="vector-main-menu-unpinned-container">
    <div class="vector-pinnable-header-label">Main menu</div>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-pin-button" data-event-name="pinnable-header.vector-main-menu.pin">move to sidebar</button>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-unpin-button" data-event-name="pinnable-header.vector-main-menu.unpin">hide</button>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-navigation" id="p-navigation">
    <div class="vector-menu-heading">
    		Navigation
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="mw-list-item" id="n-mainpage-description"><a accesskey="z" href="/wiki/Main_Page" title="Visit the main page [z]"><span>Main page</span></a></li><li class="mw-list-item" id="n-contents"><a href="/wiki/Wikipedia:Contents" title="Guides to browsing Wikipedia"><span>Contents</span></a></li><li class="mw-list-item" id="n-currentevents"><a href="/wiki/Portal:Current_events" title="Articles related to current events"><span>Current events</span></a></li><li class="mw-list-item" id="n-randompage"><a accesskey="x" href="/wiki/Special:Random" title="Visit a randomly selected article [x]"><span>Random article</span></a></li><li class="mw-list-item" id="n-aboutsite"><a href="/wiki/Wikipedia:About" title="Learn about Wikipedia and how it works"><span>About Wikipedia</span></a></li><li class="mw-list-item" id="n-contactpage"><a href="//en.wikipedia.org/wiki/Wikipedia:Contact_us" title="How to contact Wikipedia"><span>Contact us</span></a></li><li class="mw-list-item" id="n-sitesupport"><a href="https://donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wikipedia.org&amp;uselang=en" title="Support us by donating to the Wikimedia Foundation"><span>Donate</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-interaction" id="p-interaction">
    <div class="vector-menu-heading">
    		Contribute
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="mw-list-item" id="n-help"><a href="/wiki/Help:Contents" title="Guidance on how to use and edit Wikipedia"><span>Help</span></a></li><li class="mw-list-item" id="n-introduction"><a href="/wiki/Help:Introduction" title="Learn how to edit Wikipedia"><span>Learn to edit</span></a></li><li class="mw-list-item" id="n-portal"><a href="/wiki/Wikipedia:Community_portal" title="The hub for editors"><span>Community portal</span></a></li><li class="mw-list-item" id="n-recentchanges"><a accesskey="r" href="/wiki/Special:RecentChanges" title="A list of recent changes to Wikipedia [r]"><span>Recent changes</span></a></li><li class="mw-list-item" id="n-upload"><a href="/wiki/Wikipedia:File_upload_wizard" title="Add images or other media for use on Wikipedia"><span>Upload file</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-main-menu-action vector-main-menu-action-lang-alert">
    <div class="vector-main-menu-action-item">
    <div class="vector-main-menu-action-heading vector-menu-heading">Languages</div>
    <div class="vector-main-menu-action-content vector-menu-content">
    <div class="mw-message-box cdx-message cdx-message--block mw-message-box-notice cdx-message--notice vector-language-sidebar-alert"><span class="cdx-message__icon"></span><div class="cdx-message__content">Language links are at the top of the page across from the title.</div></div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </nav>
    <a class="mw-logo" href="/wiki/Main_Page">
    <img alt="" aria-hidden="true" class="mw-logo-icon" height="50" src="/static/images/icons/wikipedia.png" width="50"/>
    <span class="mw-logo-container">
    <img alt="Wikipedia" class="mw-logo-wordmark" src="/static/images/mobile/copyright/wikipedia-wordmark-en.svg" style="width: 7.5em; height: 1.125em;"/>
    <img alt="The Free Encyclopedia" class="mw-logo-tagline" height="13" src="/static/images/mobile/copyright/wikipedia-tagline-en.svg" style="width: 7.3125em; height: 0.8125em;" width="117"/>
    </span>
    </a>
    </div>
    <div class="vector-header-end">
    <div class="vector-search-box-vue vector-search-box-collapses vector-search-box-show-thumbnail vector-search-box-auto-expand-width vector-search-box" id="p-search" role="search">
    <a accesskey="f" class="cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet cdx-button--icon-only search-toggle" href="/wiki/Special:Search" id="" title="Search Wikipedia [f]"><span class="vector-icon mw-ui-icon-search mw-ui-icon-wikimedia-search"></span>
    <span>Search</span>
    </a>
    <div class="vector-typeahead-search-container">
    <div class="cdx-typeahead-search cdx-typeahead-search--show-thumbnail cdx-typeahead-search--auto-expand-width">
    <form action="/w/index.php" class="cdx-search-input cdx-search-input--has-end-button" id="searchform">
    <div class="cdx-search-input__input-wrapper" data-search-loc="header-moved" id="simpleSearch">
    <div class="cdx-text-input cdx-text-input--has-start-icon">
    <input accesskey="f" aria-label="Search Wikipedia" autocapitalize="sentences" class="cdx-text-input__input" id="searchInput" name="search" placeholder="Search Wikipedia" title="Search Wikipedia [f]" type="search"/>
    <span class="cdx-text-input__icon cdx-text-input__start-icon"></span>
    </div>
    <input name="title" type="hidden" value="Special:Search"/>
    </div>
    <button class="cdx-button cdx-search-input__end-button">Search</button>
    </form>
    </div>
    </div>
    </div>
    <nav aria-label="Personal tools" class="vector-user-links" role="navigation">
    <div class="vector-menu mw-portlet mw-portlet-vector-user-menu-overflow" id="p-vector-user-menu-overflow">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="user-links-collapsible-item mw-list-item" id="pt-createaccount-2"><a href="/w/index.php?title=Special:CreateAccount&amp;returnto=List+of+largest+companies+in+the+United+States+by+revenue" title="You are encouraged to create an account and log in; however, it is not mandatory"><span>Create account</span></a></li><li class="user-links-collapsible-item mw-list-item" id="pt-login-2"><a accesskey="o" href="/w/index.php?title=Special:UserLogin&amp;returnto=List+of+largest+companies+in+the+United+States+by+revenue" title="You're encouraged to log in; however, it's not mandatory. [o]"><span>Log in</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-dropdown vector-user-menu vector-button-flush-right vector-user-menu-logged-out" id="vector-user-links-dropdown" title="Log in and more options">
    <input aria-haspopup="true" aria-label="Personal tools" class="vector-dropdown-checkbox" data-event-name="ui.dropdown-vector-user-links-dropdown" id="vector-user-links-dropdown-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet cdx-button--icon-only" for="vector-user-links-dropdown-checkbox" id="vector-user-links-dropdown-label"><span class="vector-icon mw-ui-icon-ellipsis mw-ui-icon-wikimedia-ellipsis"></span>
    <span class="vector-dropdown-label-text">Personal tools</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-menu mw-portlet mw-portlet-personal user-links-collapsible-item" id="p-personal" title="User menu">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="user-links-collapsible-item mw-list-item" id="pt-createaccount"><a href="/w/index.php?title=Special:CreateAccount&amp;returnto=List+of+largest+companies+in+the+United+States+by+revenue" title="You are encouraged to create an account and log in; however, it is not mandatory"><span class="vector-icon mw-ui-icon-userAdd mw-ui-icon-wikimedia-userAdd"></span> <span>Create account</span></a></li><li class="user-links-collapsible-item mw-list-item" id="pt-login"><a accesskey="o" href="/w/index.php?title=Special:UserLogin&amp;returnto=List+of+largest+companies+in+the+United+States+by+revenue" title="You're encouraged to log in; however, it's not mandatory. [o]"><span class="vector-icon mw-ui-icon-logIn mw-ui-icon-wikimedia-logIn"></span> <span>Log in</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-user-menu-anon-editor" id="p-user-menu-anon-editor">
    <div class="vector-menu-heading">
    		Pages for logged out editors <a aria-label="Learn more about editing" href="/wiki/Help:Introduction"><span>learn more</span></a>
    </div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="mw-list-item" id="pt-anoncontribs"><a accesskey="y" href="/wiki/Special:MyContributions" title="A list of edits made from this IP address [y]"><span>Contributions</span></a></li><li class="mw-list-item" id="pt-anontalk"><a accesskey="n" href="/wiki/Special:MyTalk" title="Discussion about edits from this IP address [n]"><span>Talk</span></a></li>
    </ul>
    </div>
    </div>
    </div>
    </div>
    </nav>
    </div>
    </header>
    </div>
    <div class="mw-page-container">
    <div class="mw-page-container-inner">
    <div class="vector-sitenotice-container">
    <div id="siteNotice"><!-- CentralNotice --></div>
    </div>
    <div class="vector-main-menu-container">
    <div id="mw-navigation">
    <nav aria-label="Site" class="vector-main-menu-landmark" id="mw-panel" role="navigation">
    <div class="vector-pinned-container" id="vector-main-menu-pinned-container">
    </div>
    </nav>
    </div>
    </div>
    <nav aria-label="Contents" class="mw-table-of-contents-container vector-toc-landmark vector-sticky-pinned-container" data-event-name="ui.sidebar-toc" id="mw-panel-toc" role="navigation">
    <div class="vector-pinned-container" id="vector-toc-pinned-container">
    <div class="vector-toc vector-pinnable-element" id="vector-toc">
    <div class="vector-pinnable-header vector-toc-pinnable-header vector-pinnable-header-pinned" data-feature-name="toc-pinned" data-pinnable-element-id="vector-toc">
    <h2 class="vector-pinnable-header-label">Contents</h2>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-pin-button" data-event-name="pinnable-header.vector-toc.pin">move to sidebar</button>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-unpin-button" data-event-name="pinnable-header.vector-toc.unpin">hide</button>
    </div>
    <ul class="vector-toc-contents" id="mw-panel-toc-list">
    <li class="vector-toc-list-item vector-toc-level-1" id="toc-mw-content-text">
    <a class="vector-toc-link" href="#">
    <div class="vector-toc-text">(Top)</div>
    </a>
    </li>
    <li class="vector-toc-list-item vector-toc-level-1 vector-toc-list-item-expanded" id="toc-List_of_the_largest_companies">
    <a class="vector-toc-link" href="#List_of_the_largest_companies">
    <div class="vector-toc-text">
    <span class="vector-toc-numb">1</span>List of the largest companies</div>
    </a>
    <ul class="vector-toc-list" id="toc-List_of_the_largest_companies-sublist">
    </ul>
    </li>
    <li class="vector-toc-list-item vector-toc-level-1 vector-toc-list-item-expanded" id="toc-List_of_largest_private_companies">
    <a class="vector-toc-link" href="#List_of_largest_private_companies">
    <div class="vector-toc-text">
    <span class="vector-toc-numb">2</span>List of largest private companies</div>
    </a>
    <ul class="vector-toc-list" id="toc-List_of_largest_private_companies-sublist">
    </ul>
    </li>
    <li class="vector-toc-list-item vector-toc-level-1 vector-toc-list-item-expanded" id="toc-List_of_companies_by_profit">
    <a class="vector-toc-link" href="#List_of_companies_by_profit">
    <div class="vector-toc-text">
    <span class="vector-toc-numb">3</span>List of companies by profit</div>
    </a>
    <ul class="vector-toc-list" id="toc-List_of_companies_by_profit-sublist">
    </ul>
    </li>
    <li class="vector-toc-list-item vector-toc-level-1 vector-toc-list-item-expanded" id="toc-See_also">
    <a class="vector-toc-link" href="#See_also">
    <div class="vector-toc-text">
    <span class="vector-toc-numb">4</span>See also</div>
    </a>
    <ul class="vector-toc-list" id="toc-See_also-sublist">
    </ul>
    </li>
    <li class="vector-toc-list-item vector-toc-level-1 vector-toc-list-item-expanded" id="toc-References">
    <a class="vector-toc-link" href="#References">
    <div class="vector-toc-text">
    <span class="vector-toc-numb">5</span>References</div>
    </a>
    <ul class="vector-toc-list" id="toc-References-sublist">
    </ul>
    </li>
    </ul>
    </div>
    </div>
    </nav>
    <div class="mw-content-container">
    <main class="mw-body" id="content" role="main">
    <header class="mw-body-header vector-page-titlebar">
    <nav aria-label="Contents" class="vector-toc-landmark" role="navigation">
    <div class="vector-dropdown vector-page-titlebar-toc vector-button-flush-left" id="vector-page-titlebar-toc">
    <input aria-haspopup="true" aria-label="Toggle the table of contents" class="vector-dropdown-checkbox" data-event-name="ui.dropdown-vector-page-titlebar-toc" id="vector-page-titlebar-toc-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet cdx-button--icon-only" for="vector-page-titlebar-toc-checkbox" id="vector-page-titlebar-toc-label"><span class="vector-icon mw-ui-icon-listBullet mw-ui-icon-wikimedia-listBullet"></span>
    <span class="vector-dropdown-label-text">Toggle the table of contents</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-unpinned-container" id="vector-page-titlebar-toc-unpinned-container">
    </div>
    </div>
    </div>
    </nav>
    <h1 class="firstHeading mw-first-heading" id="firstHeading"><span class="mw-page-title-main">List of largest companies in the United States by revenue</span></h1>
    <div class="vector-dropdown mw-portlet mw-portlet-lang" id="p-lang-btn">
    <input aria-haspopup="true" aria-label="Go to an article in another language. Available in 9 languages" class="vector-dropdown-checkbox mw-interlanguage-selector" data-event-name="ui.dropdown-p-lang-btn" id="p-lang-btn-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet cdx-button--action-progressive mw-portlet-lang-heading-9" for="p-lang-btn-checkbox" id="p-lang-btn-label"><span class="vector-icon mw-ui-icon-language-progressive mw-ui-icon-wikimedia-language-progressive"></span>
    <span class="vector-dropdown-label-text">9 languages</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="interlanguage-link interwiki-de mw-list-item"><a class="interlanguage-link-target" href="https://de.wikipedia.org/wiki/Liste_der_gr%C3%B6%C3%9Ften_Unternehmen_in_den_Vereinigten_Staaten" hreflang="de" lang="de" title="Liste der größten Unternehmen in den Vereinigten Staaten – German"><span>Deutsch</span></a></li><li class="interlanguage-link interwiki-fa mw-list-item"><a class="interlanguage-link-target" href="https://fa.wikipedia.org/wiki/%D9%81%D9%87%D8%B1%D8%B3%D8%AA_%D8%B4%D8%B1%DA%A9%D8%AA%E2%80%8C%D9%87%D8%A7%DB%8C_%D8%A2%D9%85%D8%B1%DB%8C%DA%A9%D8%A7%DB%8C%DB%8C" hreflang="fa" lang="fa" title="فهرست شرکت‌های آمریکایی – Persian"><span>فارسی</span></a></li><li class="interlanguage-link interwiki-id mw-list-item"><a class="interlanguage-link-target" href="https://id.wikipedia.org/wiki/Daftar_perusahaan_Amerika_Serikat" hreflang="id" lang="id" title="Daftar perusahaan Amerika Serikat – Indonesian"><span>Bahasa Indonesia</span></a></li><li class="interlanguage-link interwiki-nl mw-list-item"><a class="interlanguage-link-target" href="https://nl.wikipedia.org/wiki/Lijst_van_Amerikaanse_ondernemingen" hreflang="nl" lang="nl" title="Lijst van Amerikaanse ondernemingen – Dutch"><span>Nederlands</span></a></li><li class="interlanguage-link interwiki-ja mw-list-item"><a class="interlanguage-link-target" href="https://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%A1%E3%83%AA%E3%82%AB%E5%90%88%E8%A1%86%E5%9B%BD%E3%81%AE%E4%BC%81%E6%A5%AD%E4%B8%80%E8%A6%A7" hreflang="ja" lang="ja" title="アメリカ合衆国の企業一覧 – Japanese"><span>日本語</span></a></li><li class="interlanguage-link interwiki-pnb mw-list-item"><a class="interlanguage-link-target" href="https://pnb.wikipedia.org/wiki/%D8%A7%D9%85%D8%B1%DB%8C%DA%A9%DB%8C_%DA%A9%D9%85%D9%BE%D9%86%DB%8C%D8%A7%D9%86_%D8%AF%DB%8C_%D9%84%D8%B3%D9%B9" hreflang="pnb" lang="pnb" title="امریکی کمپنیان دی لسٹ – Western Punjabi"><span>پنجابی</span></a></li><li class="interlanguage-link interwiki-pt mw-list-item"><a class="interlanguage-link-target" href="https://pt.wikipedia.org/wiki/Lista_de_maiores_empresas_dos_Estados_Unidos_por_receita" hreflang="pt" lang="pt" title="Lista de maiores empresas dos Estados Unidos por receita – Portuguese"><span>Português</span></a></li><li class="interlanguage-link interwiki-ro mw-list-item"><a class="interlanguage-link-target" href="https://ro.wikipedia.org/wiki/List%C4%83_de_companii_din_Statele_Unite_ale_Americii" hreflang="ro" lang="ro" title="Listă de companii din Statele Unite ale Americii – Romanian"><span>Română</span></a></li><li class="interlanguage-link interwiki-ur mw-list-item"><a class="interlanguage-link-target" href="https://ur.wikipedia.org/wiki/%D8%A7%D9%85%D8%B1%DB%8C%DA%A9%DB%8C_%DA%A9%D9%85%D9%BE%D9%86%DB%8C%D9%88%DA%BA_%DA%A9%DB%8C_%D9%81%DB%81%D8%B1%D8%B3%D8%AA" hreflang="ur" lang="ur" title="امریکی کمپنیوں کی فہرست – Urdu"><span>اردو</span></a></li>
    </ul>
    <div class="after-portlet after-portlet-lang"><span class="wb-langlinks-edit wb-langlinks-link"><a class="wbc-editpage" href="https://www.wikidata.org/wiki/Special:EntityPage/Q1860802#sitelinks-wikipedia" title="Edit interlanguage links">Edit links</a></span></div>
    </div>
    </div>
    </div>
    </header>
    <div class="vector-page-toolbar">
    <div class="vector-page-toolbar-container">
    <div id="left-navigation">
    <nav aria-label="Namespaces">
    <div class="vector-menu vector-menu-tabs mw-portlet mw-portlet-associated-pages" id="p-associated-pages">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="selected vector-tab-noicon mw-list-item" id="ca-nstab-main"><a accesskey="c" href="/wiki/List_of_largest_companies_in_the_United_States_by_revenue" title="View the content page [c]"><span>Article</span></a></li><li class="vector-tab-noicon mw-list-item" id="ca-talk"><a accesskey="t" href="/wiki/Talk:List_of_largest_companies_in_the_United_States_by_revenue" rel="discussion" title="Discuss improvements to the content page [t]"><span>Talk</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-dropdown emptyPortlet" id="p-variants">
    <input aria-haspopup="true" aria-label="Change language variant" class="vector-dropdown-checkbox" data-event-name="ui.dropdown-p-variants" id="p-variants-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet" for="p-variants-checkbox" id="p-variants-label"><span class="vector-dropdown-label-text">English</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-menu mw-portlet mw-portlet-variants emptyPortlet" id="p-variants">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    </ul>
    </div>
    </div>
    </div>
    </div>
    </nav>
    </div>
    <div class="vector-collapsible" id="right-navigation">
    <nav aria-label="Views">
    <div class="vector-menu vector-menu-tabs mw-portlet mw-portlet-views" id="p-views">
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="selected vector-tab-noicon mw-list-item" id="ca-view"><a href="/wiki/List_of_largest_companies_in_the_United_States_by_revenue"><span>Read</span></a></li><li class="vector-tab-noicon mw-list-item" id="ca-edit"><a accesskey="e" href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit" title="Edit this page [e]"><span>Edit</span></a></li><li class="vector-tab-noicon mw-list-item" id="ca-history"><a accesskey="h" href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=history" title="Past revisions of this page [h]"><span>View history</span></a></li>
    </ul>
    </div>
    </div>
    </nav>
    <nav aria-label="Page tools" class="vector-page-tools-landmark">
    <div class="vector-dropdown vector-page-tools-dropdown" id="vector-page-tools-dropdown">
    <input aria-haspopup="true" aria-label="Tools" class="vector-dropdown-checkbox" data-event-name="ui.dropdown-vector-page-tools-dropdown" id="vector-page-tools-dropdown-checkbox" role="button" type="checkbox"/>
    <label aria-hidden="true" class="vector-dropdown-label cdx-button cdx-button--fake-button cdx-button--fake-button--enabled cdx-button--weight-quiet" for="vector-page-tools-dropdown-checkbox" id="vector-page-tools-dropdown-label"><span class="vector-dropdown-label-text">Tools</span>
    </label>
    <div class="vector-dropdown-content">
    <div class="vector-unpinned-container" id="vector-page-tools-unpinned-container">
    <div class="vector-page-tools vector-pinnable-element" id="vector-page-tools">
    <div class="vector-pinnable-header vector-page-tools-pinnable-header vector-pinnable-header-unpinned" data-feature-name="page-tools-pinned" data-pinnable-element-id="vector-page-tools" data-pinned-container-id="vector-page-tools-pinned-container" data-unpinned-container-id="vector-page-tools-unpinned-container">
    <div class="vector-pinnable-header-label">Tools</div>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-pin-button" data-event-name="pinnable-header.vector-page-tools.pin">move to sidebar</button>
    <button class="vector-pinnable-header-toggle-button vector-pinnable-header-unpin-button" data-event-name="pinnable-header.vector-page-tools.unpin">hide</button>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-cactions emptyPortlet vector-has-collapsible-items" id="p-cactions" title="More options">
    <div class="vector-menu-heading">
    		Actions
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="selected vector-more-collapsible-item mw-list-item" id="ca-more-view"><a href="/wiki/List_of_largest_companies_in_the_United_States_by_revenue"><span>Read</span></a></li><li class="vector-more-collapsible-item mw-list-item" id="ca-more-edit"><a accesskey="e" href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit" title="Edit this page [e]"><span>Edit</span></a></li><li class="vector-more-collapsible-item mw-list-item" id="ca-more-history"><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=history"><span>View history</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-tb" id="p-tb">
    <div class="vector-menu-heading">
    		General
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="mw-list-item" id="t-whatlinkshere"><a accesskey="j" href="/wiki/Special:WhatLinksHere/List_of_largest_companies_in_the_United_States_by_revenue" title="List of all English Wikipedia pages containing links to this page [j]"><span>What links here</span></a></li><li class="mw-list-item" id="t-recentchangeslinked"><a accesskey="k" href="/wiki/Special:RecentChangesLinked/List_of_largest_companies_in_the_United_States_by_revenue" rel="nofollow" title="Recent changes in pages linked from this page [k]"><span>Related changes</span></a></li><li class="mw-list-item" id="t-upload"><a accesskey="u" href="/wiki/Wikipedia:File_Upload_Wizard" title="Upload files [u]"><span>Upload file</span></a></li><li class="mw-list-item" id="t-specialpages"><a accesskey="q" href="/wiki/Special:SpecialPages" title="A list of all special pages [q]"><span>Special pages</span></a></li><li class="mw-list-item" id="t-permalink"><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;oldid=1183367931" title="Permanent link to this revision of this page"><span>Permanent link</span></a></li><li class="mw-list-item" id="t-info"><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=info" title="More information about this page"><span>Page information</span></a></li><li class="mw-list-item" id="t-cite"><a href="/w/index.php?title=Special:CiteThisPage&amp;page=List_of_largest_companies_in_the_United_States_by_revenue&amp;id=1183367931&amp;wpFormIdentifier=titleform" title="Information on how to cite this page"><span>Cite this page</span></a></li><li class="mw-list-item" id="t-urlshortener"><a href="/w/index.php?title=Special:UrlShortener&amp;url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FList_of_largest_companies_in_the_United_States_by_revenue"><span>Get shortened URL</span></a></li><li class="mw-list-item" id="t-wikibase"><a accesskey="g" href="https://www.wikidata.org/wiki/Special:EntityPage/Q1860802" title="Structured data on this page hosted by Wikidata [g]"><span>Wikidata item</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-coll-print_export" id="p-coll-print_export">
    <div class="vector-menu-heading">
    		Print/export
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="mw-list-item" id="coll-download-as-rl"><a href="/w/index.php?title=Special:DownloadAsPdf&amp;page=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=show-download-screen" title="Download this page as a PDF file"><span>Download as PDF</span></a></li><li class="mw-list-item" id="t-print"><a accesskey="p" href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;printable=yes" title="Printable version of this page [p]"><span>Printable version</span></a></li>
    </ul>
    </div>
    </div>
    <div class="vector-menu mw-portlet mw-portlet-wikibase-otherprojects" id="p-wikibase-otherprojects">
    <div class="vector-menu-heading">
    		In other projects
    	</div>
    <div class="vector-menu-content">
    <ul class="vector-menu-content-list">
    <li class="wb-otherproject-link wb-otherproject-commons mw-list-item"><a href="https://commons.wikimedia.org/wiki/Category:Companies_of_the_United_States" hreflang="en"><span>Wikimedia Commons</span></a></li>
    </ul>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </nav>
    </div>
    </div>
    </div>
    <div class="vector-column-end">
    <nav aria-label="Page tools" class="vector-page-tools-landmark vector-sticky-pinned-container">
    <div class="vector-pinned-container" id="vector-page-tools-pinned-container">
    </div>
    </nav>
    </div>
    <div aria-labelledby="firstHeading" class="vector-body" data-mw-ve-target-container="" id="bodyContent">
    <div class="vector-body-before-content">
    <div class="mw-indicators">
    </div>
    <div class="noprint" id="siteSub">From Wikipedia, the free encyclopedia</div>
    </div>
    <div id="contentSub"><div id="mw-content-subtitle"></div></div>
    <div class="mw-body-content mw-content-ltr" dir="ltr" id="mw-content-text" lang="en"><div class="mw-parser-output"><p class="mw-empty-elt">
    </p>
    <style data-mw-deduplicate="TemplateStyles:r1097763485">.mw-parser-output .ambox{border:1px solid #a2a9b1;border-left:10px solid #36c;background-color:#fbfbfb;box-sizing:border-box}.mw-parser-output .ambox+link+.ambox,.mw-parser-output .ambox+link+style+.ambox,.mw-parser-output .ambox+link+link+.ambox,.mw-parser-output .ambox+.mw-empty-elt+link+.ambox,.mw-parser-output .ambox+.mw-empty-elt+link+style+.ambox,.mw-parser-output .ambox+.mw-empty-elt+link+link+.ambox{margin-top:-1px}html body.mediawiki .mw-parser-output .ambox.mbox-small-left{margin:4px 1em 4px 0;overflow:hidden;width:238px;border-collapse:collapse;font-size:88%;line-height:1.25em}.mw-parser-output .ambox-speedy{border-left:10px solid #b32424;background-color:#fee7e6}.mw-parser-output .ambox-delete{border-left:10px solid #b32424}.mw-parser-output .ambox-content{border-left:10px solid #f28500}.mw-parser-output .ambox-style{border-left:10px solid #fc3}.mw-parser-output .ambox-move{border-left:10px solid #9932cc}.mw-parser-output .ambox-protection{border-left:10px solid #a2a9b1}.mw-parser-output .ambox .mbox-text{border:none;padding:0.25em 0.5em;width:100%}.mw-parser-output .ambox .mbox-image{border:none;padding:2px 0 2px 0.5em;text-align:center}.mw-parser-output .ambox .mbox-imageright{border:none;padding:2px 0.5em 2px 0;text-align:center}.mw-parser-output .ambox .mbox-empty-cell{border:none;padding:0;width:1px}.mw-parser-output .ambox .mbox-image-div{width:52px}html.client-js body.skin-minerva .mw-parser-output .mbox-text-span{margin-left:23px!important}@media(min-width:720px){.mw-parser-output .ambox{margin:0 10%}}</style><table class="box-More_citations_needed plainlinks metadata ambox ambox-content ambox-Refimprove" role="presentation"><tbody><tr><td class="mbox-image"><div class="mbox-image-div"><span typeof="mw:File"><a class="mw-file-description" href="/wiki/File:Question_book-new.svg"><img alt="" class="mw-file-element" data-file-height="399" data-file-width="512" decoding="async" height="39" src="//upload.wikimedia.org/wikipedia/en/thumb/9/99/Question_book-new.svg/50px-Question_book-new.svg.png" srcset="//upload.wikimedia.org/wikipedia/en/thumb/9/99/Question_book-new.svg/75px-Question_book-new.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/9/99/Question_book-new.svg/100px-Question_book-new.svg.png 2x" width="50"/></a></span></div></td><td class="mbox-text"><div class="mbox-text-span">This article <b>needs additional citations for <a href="/wiki/Wikipedia:Verifiability" title="Wikipedia:Verifiability">verification</a></b>.<span class="hide-when-compact"> Please help <a href="/wiki/Special:EditPage/List_of_largest_companies_in_the_United_States_by_revenue" title="Special:EditPage/List of largest companies in the United States by revenue">improve this article</a> by <a href="/wiki/Help:Referencing_for_beginners" title="Help:Referencing for beginners">adding citations to reliable sources</a>. Unsourced material may be challenged and removed.<br/><small><span class="plainlinks"><i>Find sources:</i> <a class="external text" href="https://www.google.com/search?as_eq=wikipedia&amp;q=%22List+of+largest+companies+in+the+United+States+by+revenue%22" rel="nofollow">"List of largest companies in the United States by revenue"</a> – <a class="external text" href="https://www.google.com/search?tbm=nws&amp;q=%22List+of+largest+companies+in+the+United+States+by+revenue%22+-wikipedia&amp;tbs=ar:1" rel="nofollow">news</a> <b>·</b> <a class="external text" href="https://www.google.com/search?&amp;q=%22List+of+largest+companies+in+the+United+States+by+revenue%22&amp;tbs=bkt:s&amp;tbm=bks" rel="nofollow">newspapers</a> <b>·</b> <a class="external text" href="https://www.google.com/search?tbs=bks:1&amp;q=%22List+of+largest+companies+in+the+United+States+by+revenue%22+-wikipedia" rel="nofollow">books</a> <b>·</b> <a class="external text" href="https://scholar.google.com/scholar?q=%22List+of+largest+companies+in+the+United+States+by+revenue%22" rel="nofollow">scholar</a> <b>·</b> <a class="external text" href="https://www.jstor.org/action/doBasicSearch?Query=%22List+of+largest+companies+in+the+United+States+by+revenue%22&amp;acc=on&amp;wc=on" rel="nofollow">JSTOR</a></span></small></span> <span class="date-container"><i>(<span class="date">June 2020</span>)</i></span><span class="hide-when-compact"><i> (<small><a href="/wiki/Help:Maintenance_template_removal" title="Help:Maintenance template removal">Learn how and when to remove this template message</a></small>)</i></span></div></td></tr></tbody></table>
    <p>This list comprises the <b>largest companies</b> currently in the <a href="/wiki/United_States" title="United States">United States</a> by <b><a href="/wiki/Revenue" title="Revenue">revenue</a></b> as of 2023, according to the <a href="/wiki/Fortune_500" title="Fortune 500">Fortune 500</a> tally of companies and <a href="/wiki/Forbes" title="Forbes">Forbes</a>.
    </p><p>The Fortune 500 list of companies includes only <a href="/wiki/Public_company" title="Public company">publicly traded companies</a>, also including tax inversion companies. There are also corporations having foundation in the United States, such as corporate headquarters, operational headquarters and independent subsidiaries. The list excludes large <a href="/wiki/Privately_held_company" title="Privately held company">privately held companies</a> such as <a href="/wiki/Cargill" title="Cargill">Cargill</a> and <a href="/wiki/Koch_Industries" title="Koch Industries">Koch Industries</a> whose financial data is not necessarily available to the public. However, this list does include several <a href="/wiki/Government-sponsored_enterprise" title="Government-sponsored enterprise">government-sponsored enterprises</a> that were created by acts of Congress and later became publicly traded.
    </p>
    <meta property="mw:PageProp/toc"/>
    <h2><span class="mw-headline" id="List_of_the_largest_companies">List of the largest companies</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit&amp;section=1" title="Edit section: List of the largest companies"><span>edit</span></a><span class="mw-editsection-bracket">]</span></span></h2>
    <p>Below are the 100 largest companies by revenue in 2023 (mostly for fiscal year 2022), according to the <a href="/wiki/Fortune_500" title="Fortune 500">Fortune 500</a> list.<sup class="reference" id="cite_ref-1"><a href="#cite_note-1">[1]</a></sup>
    </p>
    <table class="wikitable sortable">
    <caption>
    </caption>
    <tbody><tr>
    <th>Rank
    </th>
    <th>Name
    </th>
    <th>Industry
    </th>
    <th>Revenue <br/>(USD millions)
    </th>
    <th>Revenue growth
    </th>
    <th>Employees
    </th>
    <th>Headquarters
    </th></tr>
    <tr>
    <td>1
    </td>
    <td><a href="/wiki/Walmart" title="Walmart">Walmart</a>
    </td>
    <td><a href="/wiki/Retail" title="Retail">Retail</a>
    </td>
    <td style="text-align:center;">611,289
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.7%
    </td>
    <td style="text-align:center;">2,100,000
    </td>
    <td><a href="/wiki/Bentonville,_Arkansas" title="Bentonville, Arkansas">Bentonville, Arkansas</a>
    </td></tr>
    <tr>
    <td>2
    </td>
    <td><a href="/wiki/Amazon_(company)" title="Amazon (company)">Amazon</a>
    </td>
    <td>Retail and <a href="/wiki/Cloud_computing" title="Cloud computing">cloud computing</a>
    </td>
    <td style="text-align:center;">513,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">1,540,000
    </td>
    <td><a href="/wiki/Seattle" title="Seattle">Seattle, Washington</a>
    </td></tr>
    <tr>
    <td>3
    </td>
    <td><a href="/wiki/ExxonMobil" title="ExxonMobil">ExxonMobil</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">413,680
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 44.8%
    </td>
    <td style="text-align:center;">62,000
    </td>
    <td><a href="/wiki/Spring,_Texas" title="Spring, Texas">Spring, Texas</a>
    </td></tr>
    <tr>
    <td>4
    </td>
    <td><a class="mw-redirect" href="/wiki/Apple_Inc" title="Apple Inc">Apple</a>
    </td>
    <td><a href="/wiki/Electronics_industry" title="Electronics industry">Electronics industry</a>
    </td>
    <td style="text-align:center;">394,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 7.8%
    </td>
    <td style="text-align:center;">164,000
    </td>
    <td><a href="/wiki/Cupertino,_California" title="Cupertino, California">Cupertino, California</a>
    </td></tr>
    <tr>
    <td>5
    </td>
    <td><a href="/wiki/UnitedHealth_Group" title="UnitedHealth Group">UnitedHealth Group</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Healthcare" title="Healthcare">Healthcare</a>
    </td>
    <td style="text-align:center;">324,162
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 12.7%
    </td>
    <td style="text-align:center;">400,000
    </td>
    <td><a href="/wiki/Minnetonka,_Minnesota" title="Minnetonka, Minnesota">Minnetonka, Minnesota</a>
    </td></tr>
    <tr>
    <td>6
    </td>
    <td><a href="/wiki/CVS_Health" title="CVS Health">CVS Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">322,467
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 10.4%
    </td>
    <td style="text-align:center;">259,500
    </td>
    <td><a href="/wiki/Woonsocket,_Rhode_Island" title="Woonsocket, Rhode Island">Woonsocket, Rhode Island</a>
    </td></tr>
    <tr>
    <td>7
    </td>
    <td><a href="/wiki/Berkshire_Hathaway" title="Berkshire Hathaway">Berkshire Hathaway</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a>
    </td>
    <td style="text-align:center;">302,089
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">383,000
    </td>
    <td><a href="/wiki/Omaha,_Nebraska" title="Omaha, Nebraska">Omaha, Nebraska</a>
    </td></tr>
    <tr>
    <td>8
    </td>
    <td><a class="mw-redirect" href="/wiki/Alphabet_Inc" title="Alphabet Inc">Alphabet</a>
    </td>
    <td><a href="/wiki/Technology" title="Technology">Technology</a> and Cloud Computing
    </td>
    <td style="text-align:center;">282,836
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.8%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a href="/wiki/Mountain_View,_California" title="Mountain View, California">Mountain View, California</a>
    </td></tr>
    <tr>
    <td>9
    </td>
    <td><a href="/wiki/McKesson_Corporation" title="McKesson Corporation">McKesson Corporation</a>
    </td>
    <td>Health
    </td>
    <td style="text-align:center;">276,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.8%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/Irving,_Texas" title="Irving, Texas">Irving, Texas</a>
    </td></tr>
    <tr>
    <td>10
    </td>
    <td><a href="/wiki/Chevron_Corporation" title="Chevron Corporation">Chevron Corporation</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">246,252
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.6%
    </td>
    <td style="text-align:center;">43,846
    </td>
    <td><a href="/wiki/San_Ramon,_California" title="San Ramon, California">San Ramon, California</a>
    </td></tr>
    <tr>
    <td>11
    </td>
    <td><a class="mw-redirect" href="/wiki/AmerisourceBergen" title="AmerisourceBergen">AmerisourceBergen</a>
    </td>
    <td><a href="/wiki/Pharmaceutical_industry" title="Pharmaceutical industry">Pharmaceutical industry</a>
    </td>
    <td style="text-align:center;">238,587
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.5%
    </td>
    <td style="text-align:center;">41,500
    </td>
    <td><a href="/wiki/Chesterbrook,_Pennsylvania" title="Chesterbrook, Pennsylvania">Chesterbrook, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>12
    </td>
    <td><a href="/wiki/Costco" title="Costco">Costco</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">226,954
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">304,000
    </td>
    <td><a href="/wiki/Issaquah,_Washington" title="Issaquah, Washington">Issaquah, Washington</a>
    </td></tr>
    <tr>
    <td>13
    </td>
    <td><a href="/wiki/Microsoft" title="Microsoft">Microsoft</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">198,270
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 18.0%
    </td>
    <td style="text-align:center;">221,000
    </td>
    <td><a href="/wiki/Redmond,_Washington" title="Redmond, Washington">Redmond, Washington</a>
    </td></tr>
    <tr>
    <td>14
    </td>
    <td><a href="/wiki/Cardinal_Health" title="Cardinal Health">Cardinal Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">181,364
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.6%
    </td>
    <td style="text-align:center;">46,035
    </td>
    <td><a href="/wiki/Dublin,_Ohio" title="Dublin, Ohio">Dublin, Ohio</a>
    </td></tr>
    <tr>
    <td>15
    </td>
    <td><a href="/wiki/Cigna" title="Cigna">Cigna</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">180,516
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.7%
    </td>
    <td style="text-align:center;">70,231
    </td>
    <td><a href="/wiki/Bloomfield,_Connecticut" title="Bloomfield, Connecticut">Bloomfield, Connecticut</a>
    </td></tr>
    <tr>
    <td>16
    </td>
    <td><a href="/wiki/Marathon_Petroleum" title="Marathon Petroleum">Marathon Petroleum</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">180,012
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.6%
    </td>
    <td style="text-align:center;">17,800
    </td>
    <td><a href="/wiki/Findlay,_Ohio" title="Findlay, Ohio">Findlay, Ohio</a>
    </td></tr>
    <tr>
    <td>17
    </td>
    <td><a href="/wiki/Phillips_66" title="Phillips 66">Phillips 66</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">175,702
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 53.0%
    </td>
    <td style="text-align:center;">13,000
    </td>
    <td><a href="/wiki/Houston" title="Houston">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>18
    </td>
    <td><a href="/wiki/Valero_Energy" title="Valero Energy">Valero Energy</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">171,189
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 58.0%
    </td>
    <td style="text-align:center;">9,743
    </td>
    <td><a href="/wiki/San_Antonio" title="San Antonio">San Antonio, Texas</a>
    </td></tr>
    <tr>
    <td>19
    </td>
    <td><a href="/wiki/Ford_Motor_Company" title="Ford Motor Company">Ford Motor Company</a>
    </td>
    <td><a href="/wiki/Automotive_industry" title="Automotive industry">Automotive industry</a>
    </td>
    <td style="text-align:center;">158,057
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.9%
    </td>
    <td style="text-align:center;">173,000
    </td>
    <td><a href="/wiki/Dearborn,_Michigan" title="Dearborn, Michigan">Dearborn, Michigan</a>
    </td></tr>
    <tr>
    <td>20
    </td>
    <td><a href="/wiki/The_Home_Depot" title="The Home Depot">The Home Depot</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">157,403
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.1%
    </td>
    <td style="text-align:center;">471,600
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>21
    </td>
    <td><a href="/wiki/General_Motors" title="General Motors">General Motors</a>
    </td>
    <td>Automotive industry
    </td>
    <td style="text-align:center;">156,735
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">167,000
    </td>
    <td><a href="/wiki/Detroit" title="Detroit">Detroit, Michigan</a>
    </td></tr>
    <tr>
    <td>22
    </td>
    <td><a class="mw-redirect" href="/wiki/Anthem_(company)" title="Anthem (company)">Elevance Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">156,595
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.0%
    </td>
    <td style="text-align:center;">102,200
    </td>
    <td><a href="/wiki/Indianapolis" title="Indianapolis">Indianapolis, Indiana</a>
    </td></tr>
    <tr>
    <td>23
    </td>
    <td><a href="/wiki/JPMorgan_Chase" title="JPMorgan Chase">JPMorgan Chase</a>
    </td>
    <td><a href="/wiki/Financial_services" title="Financial services">Financial services</a>
    </td>
    <td style="text-align:center;">154,792
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 21.7%
    </td>
    <td style="text-align:center;">293,723
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>24
    </td>
    <td><a href="/wiki/Kroger" title="Kroger">Kroger</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">148,258
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.5%
    </td>
    <td style="text-align:center;">430,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>25
    </td>
    <td><a class="mw-redirect" href="/wiki/Centene" title="Centene">Centene</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">144,547
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.7%
    </td>
    <td style="text-align:center;">74,300
    </td>
    <td><a href="/wiki/St._Louis" title="St. Louis">St. Louis, Missouri</a>
    </td></tr>
    <tr>
    <td>26
    </td>
    <td><a href="/wiki/Verizon_Communications" title="Verizon Communications">Verizon Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">136,835
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.4%
    </td>
    <td style="text-align:center;">117,100
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>27
    </td>
    <td><a href="/wiki/Walgreens_Boots_Alliance" title="Walgreens Boots Alliance">Walgreens Boots Alliance</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">132,703
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.7%
    </td>
    <td style="text-align:center;">262,500
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>28
    </td>
    <td><a href="/wiki/Fannie_Mae" title="Fannie Mae">Fannie Mae</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">121,596
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.7%
    </td>
    <td style="text-align:center;">8,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>29
    </td>
    <td><a href="/wiki/Comcast" title="Comcast">Comcast</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">121,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.3%
    </td>
    <td style="text-align:center;">186,000
    </td>
    <td><a href="/wiki/Philadelphia" title="Philadelphia">Philadelphia, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>30
    </td>
    <td><a href="/wiki/AT%26T" title="AT&amp;T">AT&amp;T</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a> and Telecomunications
    </td>
    <td style="text-align:center;">120,741
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 28.5%
    </td>
    <td style="text-align:center;">160,700
    </td>
    <td><a href="/wiki/Dallas" title="Dallas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>31
    </td>
    <td><a href="/wiki/Meta_Platforms" title="Meta Platforms">Meta Platforms</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">116,609
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.1%
    </td>
    <td style="text-align:center;">86,482
    </td>
    <td><a href="/wiki/Menlo_Park,_California" title="Menlo Park, California">Menlo Park, California</a>
    </td></tr>
    <tr>
    <td>32
    </td>
    <td><a href="/wiki/Bank_of_America" title="Bank of America">Bank of America</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">115,053
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.6%
    </td>
    <td style="text-align:center;">216,823
    </td>
    <td><a href="/wiki/Charlotte,_North_Carolina" title="Charlotte, North Carolina">Charlotte, North Carolina</a>
    </td></tr>
    <tr>
    <td>33
    </td>
    <td><a href="/wiki/Target_Corporation" title="Target Corporation">Target Corporation</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">109,120
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">440,000
    </td>
    <td><a href="/wiki/Minneapolis" title="Minneapolis">Minneapolis, Minnesota</a>
    </td></tr>
    <tr>
    <td>34
    </td>
    <td><a href="/wiki/Dell_Technologies" title="Dell Technologies">Dell Technologies</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">102,301
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 4.4%
    </td>
    <td style="text-align:center;">133,000
    </td>
    <td><a href="/wiki/Round_Rock,_Texas" title="Round Rock, Texas">Round Rock, Texas</a>
    </td></tr>
    <tr>
    <td>35
    </td>
    <td><a class="mw-redirect" href="/wiki/Archer_Daniels_Midland" title="Archer Daniels Midland">Archer Daniels Midland</a>
    </td>
    <td><a href="/wiki/Food_industry" title="Food industry">Food industry</a>
    </td>
    <td style="text-align:center;">101,556
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.1%
    </td>
    <td style="text-align:center;">41,181
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago,_Illinois" title="Chicago, Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>36
    </td>
    <td><a href="/wiki/Citigroup" title="Citigroup">Citigroup</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">101,078
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 26.6%
    </td>
    <td style="text-align:center;">238,104
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>37
    </td>
    <td><a href="/wiki/United_Parcel_Service" title="United Parcel Service">United Parcel Service</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Transportation" title="Transportation">Transportation</a>
    </td>
    <td style="text-align:center;">100,338
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.1%
    </td>
    <td style="text-align:center;">404,700
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>38
    </td>
    <td><a href="/wiki/Pfizer" title="Pfizer">Pfizer</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">100,330
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">83,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>39
    </td>
    <td><a href="/wiki/Lowe%27s" title="Lowe's">Lowe's</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">97,059
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">244,500
    </td>
    <td><a href="/wiki/Mooresville,_North_Carolina" title="Mooresville, North Carolina">Mooresville, North Carolina</a>
    </td></tr>
    <tr>
    <td>40
    </td>
    <td><a href="/wiki/Johnson_%26_Johnson" title="Johnson &amp; Johnson">Johnson &amp; Johnson</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">94,943
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 1.2%
    </td>
    <td style="text-align:center;">152,700
    </td>
    <td><a href="/wiki/New_Brunswick,_New_Jersey" title="New Brunswick, New Jersey">New Brunswick, New Jersey</a>
    </td></tr>
    <tr>
    <td>41
    </td>
    <td><a href="/wiki/FedEx" title="FedEx">FedEx</a>
    </td>
    <td>Transportation
    </td>
    <td style="text-align:center;">93,512
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.4%
    </td>
    <td style="text-align:center;">518,249
    </td>
    <td><a href="/wiki/Memphis,_Tennessee" title="Memphis, Tennessee">Memphis, Tennessee</a>
    </td></tr>
    <tr>
    <td>42
    </td>
    <td><a href="/wiki/Humana" title="Humana">Humana</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">92,870
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.8%
    </td>
    <td style="text-align:center;">67,100
    </td>
    <td><a href="/wiki/Louisville,_Kentucky" title="Louisville, Kentucky">Louisville, Kentucky</a>
    </td></tr>
    <tr>
    <td>43
    </td>
    <td><a href="/wiki/Energy_Transfer_Partners" title="Energy Transfer Partners">Energy Transfer Partners</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">89,876
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.3%
    </td>
    <td style="text-align:center;">12,565
    </td>
    <td><a class="mw-redirect" href="/wiki/Dallas,_Texas" title="Dallas, Texas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>44
    </td>
    <td><a href="/wiki/State_Farm" title="State Farm">State Farm</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">89,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">60,519
    </td>
    <td><a href="/wiki/Bloomington,_Illinois" title="Bloomington, Illinois">Bloomington, Illinois</a>
    </td></tr>
    <tr>
    <td>45
    </td>
    <td><a href="/wiki/Freddie_Mac" title="Freddie Mac">Freddie Mac</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">86,717
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.6%
    </td>
    <td style="text-align:center;">7,819
    </td>
    <td><a href="/wiki/McLean,_Virginia" title="McLean, Virginia">McLean, Virginia</a>
    </td></tr>
    <tr>
    <td>46
    </td>
    <td><a href="/wiki/PepsiCo" title="PepsiCo">PepsiCo</a>
    </td>
    <td><a href="/wiki/Drink" title="Drink">Beverage</a>
    </td>
    <td style="text-align:center;">86,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.7%
    </td>
    <td style="text-align:center;">315,000
    </td>
    <td><a href="/wiki/Purchase,_New_York" title="Purchase, New York">Purchase, New York</a>
    </td></tr>
    <tr>
    <td>47
    </td>
    <td><a href="/wiki/Wells_Fargo" title="Wells Fargo">Wells Fargo</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">82,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">238,000
    </td>
    <td><a href="/wiki/San_Francisco" title="San Francisco">San Francisco, California</a>
    </td></tr>
    <tr>
    <td>48
    </td>
    <td><a href="/wiki/The_Walt_Disney_Company" title="The Walt Disney Company">The Walt Disney Company</a>
    </td>
    <td>Media
    </td>
    <td style="text-align:center;">82,722
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.7%
    </td>
    <td style="text-align:center;">195,800
    </td>
    <td><a href="/wiki/Burbank,_California" title="Burbank, California">Burbank, California</a>
    </td></tr>
    <tr>
    <td>49
    </td>
    <td><a href="/wiki/ConocoPhillips" title="ConocoPhillips">ConocoPhillips</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">82,156
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 69.9%
    </td>
    <td style="text-align:center;">9,500
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>50
    </td>
    <td><a class="mw-redirect" href="/wiki/Tesla_Inc" title="Tesla Inc">Tesla</a>
    </td>
    <td>Automotive and Energy
    </td>
    <td style="text-align:center;">81,462
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.4%
    </td>
    <td style="text-align:center;">127,855
    </td>
    <td><a href="/wiki/Austin,_Texas" title="Austin, Texas">Austin, Texas</a>
    </td></tr>
    <tr>
    <td>51
    </td>
    <td><a href="/wiki/Procter_%26_Gamble" title="Procter &amp; Gamble">Procter &amp; Gamble</a>
    </td>
    <td>Consumer products Manufacturing
    </td>
    <td style="text-align:center;">80,187
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.3%
    </td>
    <td style="text-align:center;">106,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>52
    </td>
    <td><a href="/wiki/United_States_Postal_Service" title="United States Postal Service">United States Postal Service</a>
    </td>
    <td>Logistics
    </td>
    <td style="text-align:center;">78,620
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 2.0%
    </td>
    <td style="text-align:center;">576,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>53
    </td>
    <td><a href="/wiki/Albertsons" title="Albertsons">Albertsons</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">77,650
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.0%
    </td>
    <td style="text-align:center;">198,650
    </td>
    <td><a href="/wiki/Boise,_Idaho" title="Boise, Idaho">Boise, Idaho</a>
    </td></tr>
    <tr>
    <td>54
    </td>
    <td><a href="/wiki/General_Electric" title="General Electric">General Electric</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">76,555
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 3.2%
    </td>
    <td style="text-align:center;">172,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>55
    </td>
    <td><a href="/wiki/MetLife" title="MetLife">MetLife</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">69,898
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.7%
    </td>
    <td style="text-align:center;">45,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>56
    </td>
    <td><a href="/wiki/Goldman_Sachs" title="Goldman Sachs">Goldman Sachs</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">68,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.7%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>57
    </td>
    <td><a href="/wiki/Sysco" title="Sysco">Sysco</a>
    </td>
    <td>Food Service
    </td>
    <td style="text-align:center;">68,636
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.8%
    </td>
    <td style="text-align:center;">70,510
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>58
    </td>
    <td><a class="mw-redirect" href="/wiki/Bunge_Limited" title="Bunge Limited">Bunge Limited</a>
    </td>
    <td>Food industry
    </td>
    <td style="text-align:center;">67,232
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.7%
    </td>
    <td style="text-align:center;">23,000
    </td>
    <td><a href="/wiki/White_Plains,_New_York" title="White Plains, New York">White Plains, New York</a>
    </td></tr>
    <tr>
    <td>59
    </td>
    <td><a href="/wiki/RTX_Corporation" title="RTX Corporation">RTX Corporation</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">67,074
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.2%
    </td>
    <td style="text-align:center;">182,000
    </td>
    <td><a href="/wiki/Arlington_County,_Virginia" title="Arlington County, Virginia">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>60
    </td>
    <td><a href="/wiki/Boeing" title="Boeing">Boeing</a>
    </td>
    <td><a href="/wiki/Aerospace_engineering" title="Aerospace engineering">Aerospace</a> and <a href="/wiki/Arms_industry" title="Arms industry">defense</a>
    </td>
    <td style="text-align:center;">66,608
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.9%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Arlington_County" title="Arlington County">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>61
    </td>
    <td><a class="mw-redirect" href="/wiki/StoneX_Group" title="StoneX Group">StoneX Group</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">66,036
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 55.3%
    </td>
    <td style="text-align:center;">305
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>62
    </td>
    <td><a href="/wiki/Lockheed_Martin" title="Lockheed Martin">Lockheed Martin</a>
    </td>
    <td>Aerospace and Defense
    </td>
    <td style="text-align:center;">65,984
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.6%
    </td>
    <td style="text-align:center;">116,000
    </td>
    <td><a href="/wiki/Bethesda,_Maryland" title="Bethesda, Maryland">Bethesda, Maryland</a>
    </td></tr>
    <tr>
    <td>63
    </td>
    <td><a href="/wiki/Morgan_Stanley" title="Morgan Stanley">Morgan Stanley</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">65,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.9%
    </td>
    <td style="text-align:center;">82,427
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>64
    </td>
    <td><a href="/wiki/Intel" title="Intel">Intel</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">63,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 20.1%
    </td>
    <td style="text-align:center;">131,900
    </td>
    <td><a href="/wiki/Santa_Clara,_California" title="Santa Clara, California">Santa Clara, California</a>
    </td></tr>
    <tr>
    <td>65
    </td>
    <td><a class="mw-redirect" href="/wiki/HP_Inc" title="HP Inc">HP</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">62,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">58,000
    </td>
    <td><a href="/wiki/Palo_Alto,_California" title="Palo Alto, California">Palo Alto, California</a>
    </td></tr>
    <tr>
    <td>66
    </td>
    <td><a href="/wiki/TD_Synnex" title="TD Synnex">TD Synnex</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Infotech" title="Infotech">Infotech</a>
    </td>
    <td style="text-align:center;">62,344
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 97.2%
    </td>
    <td style="text-align:center;">28,500
    </td>
    <td><a href="/wiki/Clearwater,_Florida" title="Clearwater, Florida">Clearwater, Florida</a>
    </td></tr>
    <tr>
    <td>67
    </td>
    <td><a href="/wiki/IBM" title="IBM">IBM</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">60,530
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 16.3%
    </td>
    <td style="text-align:center;">303,100
    </td>
    <td><a href="/wiki/Armonk,_New_York" title="Armonk, New York">Armonk, New York</a>
    </td></tr>
    <tr>
    <td>68
    </td>
    <td><a href="/wiki/HCA_Healthcare" title="HCA Healthcare">HCA Healthcare</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">60,233
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.5%
    </td>
    <td style="text-align:center;">250,500
    </td>
    <td><a href="/wiki/Nashville,_Tennessee" title="Nashville, Tennessee">Nashville, Tennessee</a>
    </td></tr>
    <tr>
    <td>69
    </td>
    <td><a href="/wiki/Prudential_Financial" title="Prudential Financial">Prudential Financial</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">60,050
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 15.3%
    </td>
    <td style="text-align:center;">39,583
    </td>
    <td><a href="/wiki/Newark,_New_Jersey" title="Newark, New Jersey">Newark, New Jersey</a>
    </td></tr>
    <tr>
    <td>70
    </td>
    <td><a class="mw-redirect" href="/wiki/Caterpillar_Inc" title="Caterpillar Inc">Caterpillar</a>
    </td>
    <td>Machinery
    </td>
    <td style="text-align:center;">59,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 16.6%
    </td>
    <td style="text-align:center;">109,100
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>71
    </td>
    <td><a href="/wiki/Merck_%26_Co." title="Merck &amp; Co.">Merck &amp; Co.</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">59,283
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">68,000
    </td>
    <td><a href="/wiki/Kenilworth,_New_Jersey" title="Kenilworth, New Jersey">Kenilworth, New Jersey</a>
    </td></tr>
    <tr>
    <td>72
    </td>
    <td><a class="mw-redirect" href="/wiki/World_Fuel_Services" title="World Fuel Services">World Fuel Services</a>
    </td>
    <td>Petroleum industry and Logistics
    </td>
    <td style="text-align:center;">59,043
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 88.4%
    </td>
    <td style="text-align:center;">5,214
    </td>
    <td><a class="mw-redirect" href="/wiki/Miami,_Florida" title="Miami, Florida">Miami, Florida</a>
    </td></tr>
    <tr>
    <td>73
    </td>
    <td><a href="/wiki/New_York_Life_Insurance_Company" title="New York Life Insurance Company">New York Life Insurance Company</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">58,445
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.2%
    </td>
    <td style="text-align:center;">15,050
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>74
    </td>
    <td><a href="/wiki/Enterprise_Products" title="Enterprise Products">Enterprise Products</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">58,186
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 42.6%
    </td>
    <td style="text-align:center;">7,300
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>75
    </td>
    <td><a href="/wiki/AbbVie" title="AbbVie">AbbVie</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">58,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.3%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Lake_Bluff,_Illinois" title="Lake Bluff, Illinois">Lake Bluff, Illinois</a>
    </td></tr>
    <tr>
    <td>76
    </td>
    <td><a href="/wiki/Plains_All_American_Pipeline" title="Plains All American Pipeline">Plains All American Pipeline</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">57,342
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 36.3%
    </td>
    <td style="text-align:center;">4,100
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>77
    </td>
    <td><a href="/wiki/Dow_Chemical_Company" title="Dow Chemical Company">Dow Chemical Company</a>
    </td>
    <td><a href="/wiki/Chemical_industry" title="Chemical industry">Chemical industry</a>
    </td>
    <td style="text-align:center;">56,902
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">37,800
    </td>
    <td><a href="/wiki/Midland,_Michigan" title="Midland, Michigan">Midland, Michigan</a>
    </td></tr>
    <tr>
    <td>78
    </td>
    <td><a class="mw-redirect" href="/wiki/AIG" title="AIG">AIG</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">56,437
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.4%
    </td>
    <td style="text-align:center;">26,200
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>79
    </td>
    <td><a href="/wiki/American_Express" title="American Express">American Express</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">55,625
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.3%
    </td>
    <td style="text-align:center;">77,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>80
    </td>
    <td><a href="/wiki/Publix" title="Publix">Publix</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">54,942
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.5%
    </td>
    <td style="text-align:center;">242,000
    </td>
    <td><a href="/wiki/Lakeland,_Florida" title="Lakeland, Florida">Lakeland, Florida</a>
    </td></tr>
    <tr>
    <td>81
    </td>
    <td><a href="/wiki/Charter_Communications" title="Charter Communications">Charter Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">54,022
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.5%
    </td>
    <td style="text-align:center;">101,700
    </td>
    <td><a href="/wiki/Stamford,_Connecticut" title="Stamford, Connecticut">Stamford, Connecticut</a>
    </td></tr>
    <tr>
    <td>82
    </td>
    <td><a href="/wiki/Tyson_Foods" title="Tyson Foods">Tyson Foods</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">53,282
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.2%
    </td>
    <td style="text-align:center;">142,000
    </td>
    <td><a href="/wiki/Springdale,_Arkansas" title="Springdale, Arkansas">Springdale, Arkansas</a>
    </td></tr>
    <tr>
    <td>83
    </td>
    <td><a href="/wiki/John_Deere" title="John Deere">John Deere</a>
    </td>
    <td>Agriculture manufacturing
    </td>
    <td style="text-align:center;">52,577
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.4%
    </td>
    <td style="text-align:center;">82,239
    </td>
    <td><a href="/wiki/Moline,_Illinois" title="Moline, Illinois">Moline, Illinois</a>
    </td></tr>
    <tr>
    <td>84
    </td>
    <td><a href="/wiki/Cisco" title="Cisco">Cisco</a>
    </td>
    <td>Telecom Hardware Manufacturing
    </td>
    <td style="text-align:center;">51,557
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">83,300
    </td>
    <td><a href="/wiki/San_Jose,_California" title="San Jose, California">San Jose, California</a>
    </td></tr>
    <tr>
    <td>85
    </td>
    <td><a href="/wiki/Nationwide_Mutual_Insurance_Company" title="Nationwide Mutual Insurance Company">Nationwide Mutual Insurance Company</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">51,450
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">24,791
    </td>
    <td><a href="/wiki/Columbus,_Ohio" title="Columbus, Ohio">Columbus, Ohio</a>
    </td></tr>
    <tr>
    <td>86
    </td>
    <td><a href="/wiki/Allstate" title="Allstate">Allstate</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">51,412
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 3.4%
    </td>
    <td style="text-align:center;">54,250
    </td>
    <td><a href="/wiki/Northfield_Township,_Cook_County,_Illinois" title="Northfield Township, Cook County, Illinois">Northfield Township, Cook County, Illinois</a>
    </td></tr>
    <tr>
    <td>87
    </td>
    <td><a href="/wiki/Delta_Air_Lines" title="Delta Air Lines">Delta Air Lines</a>
    </td>
    <td><a href="/wiki/Airline" title="Airline">Airline</a>
    </td>
    <td style="text-align:center;">50,582
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000400000000000000♠" style="display:none"></span> 69.2%
    </td>
    <td style="text-align:center;">95,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Atlanta_Georgia" title="Atlanta Georgia">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>88
    </td>
    <td><a href="/wiki/Liberty_Mutual" title="Liberty Mutual">Liberty Mutual</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,956
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.6%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>89
    </td>
    <td><a class="mw-redirect" href="/wiki/TJX" title="TJX">TJX</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">49,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">329,000
    </td>
    <td><a href="/wiki/Framingham,_Massachusetts" title="Framingham, Massachusetts">Framingham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>90
    </td>
    <td><a href="/wiki/Progressive_Corporation" title="Progressive Corporation">Progressive Corporation</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,611
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.0%
    </td>
    <td style="text-align:center;">55,063
    </td>
    <td><a class="mw-redirect" href="/wiki/Mayfield_Village,_Ohio" title="Mayfield Village, Ohio">Mayfield Village, Ohio</a>
    </td></tr>
    <tr>
    <td>91
    </td>
    <td><a href="/wiki/American_Airlines" title="American Airlines">American Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">48,971
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 63.9%
    </td>
    <td style="text-align:center;">129,700
    </td>
    <td><a href="/wiki/Fort_Worth,_Texas" title="Fort Worth, Texas">Fort Worth, Texas</a>
    </td></tr>
    <tr>
    <td>92
    </td>
    <td><a class="mw-redirect" href="/wiki/CHS_Inc" title="CHS Inc">CHS</a>
    </td>
    <td>Agriculture cooperative
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 24.3%
    </td>
    <td style="text-align:center;">10,014
    </td>
    <td><a class="mw-redirect" href="/wiki/Inver_Grove_Heights" title="Inver Grove Heights">Inver Grove Heights, Minnesota</a>
    </td></tr>
    <tr>
    <td>93
    </td>
    <td><a href="/wiki/Performance_Food_Group" title="Performance Food Group">Performance Food Group</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 61.6%
    </td>
    <td style="text-align:center;">34,825
    </td>
    <td><a href="/wiki/Richmond,_Virginia" title="Richmond, Virginia">Richmond, Virginia</a>
    </td></tr>
    <tr>
    <td>94
    </td>
    <td><a href="/wiki/PBF_Energy" title="PBF Energy">PBF Energy</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">46,830
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 71.8%
    </td>
    <td style="text-align:center;">3,616
    </td>
    <td><a href="/wiki/Parsippany%E2%80%93Troy_Hills,_New_Jersey" title="Parsippany–Troy Hills, New Jersey">Parsippany–Troy Hills, New Jersey</a>
    </td></tr>
    <tr>
    <td>95
    </td>
    <td><a class="mw-redirect" href="/wiki/Nike_Inc" title="Nike Inc">Nike</a>
    </td>
    <td>Apparel
    </td>
    <td style="text-align:center;">46,710
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.9%
    </td>
    <td style="text-align:center;">79,100
    </td>
    <td><a href="/wiki/Beaverton,_Oregon" title="Beaverton, Oregon">Beaverton, Oregon</a>
    </td></tr>
    <tr>
    <td>96
    </td>
    <td><a href="/wiki/Best_Buy" title="Best Buy">Best Buy</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">46,298
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.6%
    </td>
    <td style="text-align:center;">71,100
    </td>
    <td><a href="/wiki/Richfield,_Minnesota" title="Richfield, Minnesota">Richfield, Minnesota</a>
    </td></tr>
    <tr>
    <td>97
    </td>
    <td><a class="mw-redirect" href="/wiki/Bristol-Myers_Squibb" title="Bristol-Myers Squibb">Bristol-Myers Squibb</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">46,159
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">34,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City</a>, <a href="/wiki/New_York_(state)" title="New York (state)">New York</a>
    </td></tr>
    <tr>
    <td>98
    </td>
    <td><a href="/wiki/United_Airlines" title="United Airlines">United Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">44,955
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 82.5%
    </td>
    <td style="text-align:center;">92,795
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago_Illinois" title="Chicago Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>99
    </td>
    <td><a href="/wiki/Thermo_Fisher_Scientific" title="Thermo Fisher Scientific">Thermo Fisher Scientific</a>
    </td>
    <td>Laboratory instruments
    </td>
    <td style="text-align:center;">44,915
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.5%
    </td>
    <td style="text-align:center;">130,000
    </td>
    <td><a href="/wiki/Waltham,_Massachusetts" title="Waltham, Massachusetts">Waltham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>100
    </td>
    <td><a href="/wiki/Qualcomm" title="Qualcomm">Qualcomm</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">44,200
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.7%
    </td>
    <td style="text-align:center;">51,000
    </td>
    <td><a class="mw-redirect" href="/wiki/San_Diego,_Calif." title="San Diego, Calif.">San Diego, California</a>
    </td></tr></tbody></table>
    <h2><span class="mw-headline" id="List_of_largest_private_companies">List of largest private companies</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit&amp;section=2" title="Edit section: List of largest private companies"><span>edit</span></a><span class="mw-editsection-bracket">]</span></span></h2>
    <p>Below are the 10 largest private companies by revenue in 2022 (mostly for fiscal year 2021), according to <a href="/wiki/Forbes" title="Forbes">Forbes</a>.<sup class="reference" id="cite_ref-2"><a href="#cite_note-2">[2]</a></sup>
    </p>
    <table class="wikitable sortable">
    <tbody><tr>
    <th>Rank
    </th>
    <th>Name
    </th>
    <th>Industry
    </th>
    <th>Revenue <br/>(USD billions)
    </th>
    <th>Employees
    </th>
    <th>Headquarters
    </th></tr>
    <tr>
    <td>1
    </td>
    <td><a href="/wiki/Cargill" title="Cargill">Cargill</a>
    </td>
    <td>Food industry
    </td>
    <td style="text-align:center;">165
    </td>
    <td style="text-align:center;">155,000
    </td>
    <td><a href="/wiki/Minnetonka,_Minnesota" title="Minnetonka, Minnesota">Minnetonka, Minnesota</a>
    </td></tr>
    <tr>
    <td>2
    </td>
    <td><a href="/wiki/Koch_Industries" title="Koch Industries">Koch Industries</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">125
    </td>
    <td style="text-align:center;">120,000
    </td>
    <td><a href="/wiki/Wichita,_Kansas" title="Wichita, Kansas">Wichita, Kansas</a>
    </td></tr>
    <tr>
    <td>3
    </td>
    <td><a class="mw-redirect" href="/wiki/Publix_Super_Markets" title="Publix Super Markets">Publix Super Markets</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">48
    </td>
    <td style="text-align:center;">230,000
    </td>
    <td><a href="/wiki/Winter_Haven,_Florida" title="Winter Haven, Florida">Winter Haven, Florida</a>
    </td></tr>
    <tr>
    <td>4
    </td>
    <td><a href="/wiki/Mars,_Incorporated" title="Mars, Incorporated">Mars, Incorporated</a>
    </td>
    <td>Food industry
    </td>
    <td style="text-align:center;">45
    </td>
    <td style="text-align:center;">140,000
    </td>
    <td><a href="/wiki/McLean,_Virginia" title="McLean, Virginia">McLean, Virginia</a>
    </td></tr>
    <tr>
    <td>5
    </td>
    <td><a href="/wiki/Pilot_Corporation" title="Pilot Corporation">Pilot Corporation</a>
    </td>
    <td>Petroleum industry and Retail
    </td>
    <td style="text-align:center;">41.9
    </td>
    <td style="text-align:center;">30,000
    </td>
    <td><a href="/wiki/Knoxville,_Tennessee" title="Knoxville, Tennessee">Knoxville, Tennessee</a>
    </td></tr>
    <tr>
    <td>6
    </td>
    <td><a href="/wiki/H-E-B" title="H-E-B">H-E-B</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">38.9
    </td>
    <td style="text-align:center;">145,000
    </td>
    <td><a class="mw-redirect" href="/wiki/San_Antonio,_Texas" title="San Antonio, Texas">San Antonio, Texas</a>
    </td></tr>
    <tr>
    <td>7
    </td>
    <td><a href="/wiki/Reyes_Holdings" title="Reyes Holdings">Reyes Holdings</a>
    </td>
    <td><a href="/wiki/Wholesaling" title="Wholesaling">Wholesaling</a>
    </td>
    <td style="text-align:center;">35.3
    </td>
    <td style="text-align:center;">33,000
    </td>
    <td><a href="/wiki/Rosemont,_Illinois" title="Rosemont, Illinois">Rosemont, Illinois</a>
    </td></tr>
    <tr>
    <td>8
    </td>
    <td><a href="/wiki/C%26S_Wholesale_Grocers" title="C&amp;S Wholesale Grocers">C&amp;S Wholesale Grocers</a>
    </td>
    <td>Wholesaling
    </td>
    <td style="text-align:center;">33
    </td>
    <td style="text-align:center;">14,000
    </td>
    <td><a href="/wiki/Keene,_New_Hampshire" title="Keene, New Hampshire">Keene, New Hampshire</a>
    </td></tr>
    <tr>
    <td>9
    </td>
    <td><a href="/wiki/Enterprise_Holdings" title="Enterprise Holdings">Enterprise Holdings</a>
    </td>
    <td><a href="/wiki/Car_rental" title="Car rental">Car rental</a>
    </td>
    <td style="text-align:center;">30
    </td>
    <td style="text-align:center;">80,000
    </td>
    <td><a href="/wiki/Clayton,_Missouri" title="Clayton, Missouri">Clayton, Missouri</a>
    </td></tr>
    <tr>
    <td>10
    </td>
    <td><a href="/wiki/Love%27s" title="Love's">Love's</a>
    </td>
    <td>Petroleum industry and Retail
    </td>
    <td style="text-align:center;">25.5
    </td>
    <td style="text-align:center;">38,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Oklahoma_City,_Oklahoma" title="Oklahoma City, Oklahoma">Oklahoma City, Oklahoma</a>
    </td></tr></tbody></table>
    <h2><span class="mw-headline" id="List_of_companies_by_profit">List of companies by profit</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit&amp;section=3" title="Edit section: List of companies by profit"><span>edit</span></a><span class="mw-editsection-bracket">]</span></span></h2>
    <p>The 10 most profitable companies in 2023 according to the Fortune 500.<sup class="reference" id="cite_ref-3"><a href="#cite_note-3">[3]</a></sup>
    </p>
    <table class="wikitable sortable">
    <caption>
    </caption>
    <tbody><tr>
    <th>Rank
    </th>
    <th>Name
    </th>
    <th>Industry
    </th>
    <th>Profits<br/>(USD millions)
    </th></tr>
    <tr>
    <td>1
    </td>
    <td><a href="/wiki/Apple_Inc." title="Apple Inc.">Apple</a>
    </td>
    <td>Electronics
    </td>
    <td style="text-align:center;">99,803
    </td></tr>
    <tr>
    <td>2
    </td>
    <td><a href="/wiki/Microsoft" title="Microsoft">Microsoft</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">72,738
    </td></tr>
    <tr>
    <td>3
    </td>
    <td><a href="/wiki/Alphabet_Inc." title="Alphabet Inc.">Alphabet</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">59,972
    </td></tr>
    <tr>
    <td>4
    </td>
    <td><a href="/wiki/United_States_Postal_Service" title="United States Postal Service">United States Postal Service</a>
    </td>
    <td>Logistics
    </td>
    <td style="text-align:center;">56,046
    </td></tr>
    <tr>
    <td>5
    </td>
    <td><a href="/wiki/ExxonMobil" title="ExxonMobil">ExxonMobil</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">55,740
    </td></tr>
    <tr>
    <td>6
    </td>
    <td><a href="/wiki/JPMorgan_Chase" title="JPMorgan Chase">JPMorgan Chase</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">37,676
    </td></tr>
    <tr>
    <td>7
    </td>
    <td><a href="/wiki/Chevron_Corporation" title="Chevron Corporation">Chevron Corporation</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">35,465
    </td></tr>
    <tr>
    <td>8
    </td>
    <td><a href="/wiki/Pfizer" title="Pfizer">Pfizer</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">31,372
    </td></tr>
    <tr>
    <td>9
    </td>
    <td><a href="/wiki/Bank_of_America" title="Bank of America">Bank of America</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">27,528
    </td></tr>
    <tr>
    <td>10
    </td>
    <td><a href="/wiki/Meta_Platforms" title="Meta Platforms">Meta Platforms</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">23,200
    </td></tr></tbody></table>
    <h2><span class="mw-headline" id="See_also">See also</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit&amp;section=4" title="Edit section: See also"><span>edit</span></a><span class="mw-editsection-bracket">]</span></span></h2>
    <ul><li><a href="/wiki/List_of_companies_of_the_United_States_by_state" title="List of companies of the United States by state">List of companies of the United States by state</a></li>
    <li><a href="/wiki/List_of_largest_companies_by_revenue" title="List of largest companies by revenue">List of largest companies by revenue</a></li></ul>
    <h2><span class="mw-headline" id="References">References</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;action=edit&amp;section=5" title="Edit section: References"><span>edit</span></a><span class="mw-editsection-bracket">]</span></span></h2>
    <style data-mw-deduplicate="TemplateStyles:r1011085734">.mw-parser-output .reflist{font-size:90%;margin-bottom:0.5em;list-style-type:decimal}.mw-parser-output .reflist .references{font-size:100%;margin-bottom:0;list-style-type:inherit}.mw-parser-output .reflist-columns-2{column-width:30em}.mw-parser-output .reflist-columns-3{column-width:25em}.mw-parser-output .reflist-columns{margin-top:0.3em}.mw-parser-output .reflist-columns ol{margin-top:0}.mw-parser-output .reflist-columns li{page-break-inside:avoid;break-inside:avoid-column}.mw-parser-output .reflist-upper-alpha{list-style-type:upper-alpha}.mw-parser-output .reflist-upper-roman{list-style-type:upper-roman}.mw-parser-output .reflist-lower-alpha{list-style-type:lower-alpha}.mw-parser-output .reflist-lower-greek{list-style-type:lower-greek}.mw-parser-output .reflist-lower-roman{list-style-type:lower-roman}</style><div class="reflist">
    <div class="mw-references-wrap"><ol class="references">
    <li id="cite_note-1"><span class="mw-cite-backlink"><b><a href="#cite_ref-1">^</a></b></span> <span class="reference-text"><style data-mw-deduplicate="TemplateStyles:r1133582631">.mw-parser-output cite.citation{font-style:inherit;word-wrap:break-word}.mw-parser-output .citation q{quotes:"\"""\"""'""'"}.mw-parser-output .citation:target{background-color:rgba(0,127,255,0.133)}.mw-parser-output .id-lock-free a,.mw-parser-output .citation .cs1-lock-free a{background:url("//upload.wikimedia.org/wikipedia/commons/6/65/Lock-green.svg")right 0.1em center/9px no-repeat}.mw-parser-output .id-lock-limited a,.mw-parser-output .id-lock-registration a,.mw-parser-output .citation .cs1-lock-limited a,.mw-parser-output .citation .cs1-lock-registration a{background:url("//upload.wikimedia.org/wikipedia/commons/d/d6/Lock-gray-alt-2.svg")right 0.1em center/9px no-repeat}.mw-parser-output .id-lock-subscription a,.mw-parser-output .citation .cs1-lock-subscription a{background:url("//upload.wikimedia.org/wikipedia/commons/a/aa/Lock-red-alt-2.svg")right 0.1em center/9px no-repeat}.mw-parser-output .cs1-ws-icon a{background:url("//upload.wikimedia.org/wikipedia/commons/4/4c/Wikisource-logo.svg")right 0.1em center/12px no-repeat}.mw-parser-output .cs1-code{color:inherit;background:inherit;border:none;padding:inherit}.mw-parser-output .cs1-hidden-error{display:none;color:#d33}.mw-parser-output .cs1-visible-error{color:#d33}.mw-parser-output .cs1-maint{display:none;color:#3a3;margin-left:0.3em}.mw-parser-output .cs1-format{font-size:95%}.mw-parser-output .cs1-kern-left{padding-left:0.2em}.mw-parser-output .cs1-kern-right{padding-right:0.2em}.mw-parser-output .citation .mw-selflink{font-weight:inherit}</style><cite class="citation web cs1"><a class="external text" href="https://fortune.com/fortune500/2022/" rel="nofollow">"Fortune 500"</a>. <i>Fortune</i><span class="reference-accessdate">. Retrieved <span class="nowrap">2022-08-31</span></span>.</cite><span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=Fortune&amp;rft.atitle=Fortune+500&amp;rft_id=https%3A%2F%2Ffortune.com%2Ffortune500%2F2022%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AList+of+largest+companies+in+the+United+States+by+revenue"></span></span>
    </li>
    <li id="cite_note-2"><span class="mw-cite-backlink"><b><a href="#cite_ref-2">^</a></b></span> <span class="reference-text"><link href="mw-data:TemplateStyles:r1133582631" rel="mw-deduplicated-inline-style"/><cite class="citation web cs1" id="CITEREFMurphy">Murphy, Andrea. <a class="external text" href="https://www.forbes.com/lists/largest-private-companies/" rel="nofollow">"America's Largest Private Companies 2022"</a>. <i>Forbes</i><span class="reference-accessdate">. Retrieved <span class="nowrap">2023-08-04</span></span>.</cite><span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=Forbes&amp;rft.atitle=America%27s+Largest+Private+Companies+2022&amp;rft.aulast=Murphy&amp;rft.aufirst=Andrea&amp;rft_id=https%3A%2F%2Fwww.forbes.com%2Flists%2Flargest-private-companies%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AList+of+largest+companies+in+the+United+States+by+revenue"></span></span>
    </li>
    <li id="cite_note-3"><span class="mw-cite-backlink"><b><a href="#cite_ref-3">^</a></b></span> <span class="reference-text"><link href="mw-data:TemplateStyles:r1133582631" rel="mw-deduplicated-inline-style"/><cite class="citation web cs1"><a class="external text" href="https://fortune.com/ranking/global500/2023/search/?fg500_country=U.S." rel="nofollow">"Most profitable"</a>. <i>Fortune</i><span class="reference-accessdate">. Retrieved <span class="nowrap">2019-06-30</span></span>.</cite><span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=Fortune&amp;rft.atitle=Most+profitable&amp;rft_id=https%3A%2F%2Ffortune.com%2Franking%2Fglobal500%2F2023%2Fsearch%2F%3Ffg500_country%3DU.S.&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AList+of+largest+companies+in+the+United+States+by+revenue"></span></span>
    </li>
    </ol></div></div>
    <p>--
    </p>
    <!-- 
    NewPP limit report
    Parsed by mw1481
    Cached time: 20231106025644
    Cache expiry: 1814400
    Reduced expiry: false
    Complications: [vary‐revision‐sha1, show‐toc]
    CPU time usage: 0.337 seconds
    Real time usage: 0.422 seconds
    Preprocessor visited node count: 2497/1000000
    Post‐expand include size: 37471/2097152 bytes
    Template argument size: 665/2097152 bytes
    Highest expansion depth: 9/100
    Expensive parser function count: 1/500
    Unstrip recursion depth: 1/20
    Unstrip post‐expand size: 10345/5000000 bytes
    Lua time usage: 0.158/10.000 seconds
    Lua memory usage: 4320925/52428800 bytes
    Number of Wikibase entities loaded: 0/400
    -->
    <!--
    Transclusion expansion time report (%,ms,calls,template)
    100.00%  301.549      1 -total
     28.72%   86.591    100 Template:Ntsh
     26.66%   80.407      1 Template:Reflist
     22.94%   69.162      3 Template:Cite_web
     19.30%   58.188      1 Template:More_citations_needed
     18.41%   55.528      1 Template:Short_description
     17.83%   53.763      1 Template:Ambox
      9.08%   27.393      2 Template:Pagetype
      5.61%   16.904      3 Template:Main_other
      5.00%   15.088      1 Template:SDcat
    -->
    <!-- Saved in parser cache with key enwiki:pcache:idhash:61181662-0!canonical and timestamp 20231106025643 and revision id 1183367931. Rendering was triggered because: page-view
     -->
    </div><!--esi <esi:include src="/esitest-fa8a495983347898/content" /> --><noscript><img alt="" height="1" src="https://login.wikimedia.org/wiki/Special:CentralAutoLogin/start?type=1x1" style="border: none; position: absolute;" width="1"/></noscript>
    <div class="printfooter" data-nosnippet="">Retrieved from "<a dir="ltr" href="https://en.wikipedia.org/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;oldid=1183367931">https://en.wikipedia.org/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;oldid=1183367931</a>"</div></div>
    <div class="catlinks" data-mw="interface" id="catlinks"><div class="mw-normal-catlinks" id="mw-normal-catlinks"><a href="/wiki/Help:Category" title="Help:Category">Categories</a>: <ul><li><a href="/wiki/Category:Economy_of_the_United_States-related_lists" title="Category:Economy of the United States-related lists">Economy of the United States-related lists</a></li><li><a href="/wiki/Category:Lists_of_companies_by_revenue" title="Category:Lists of companies by revenue">Lists of companies by revenue</a></li><li><a href="/wiki/Category:Lists_of_largest_private_companies_by_country" title="Category:Lists of largest private companies by country">Lists of largest private companies by country</a></li><li><a href="/wiki/Category:Lists_of_companies_of_the_United_States" title="Category:Lists of companies of the United States">Lists of companies of the United States</a></li></ul></div><div class="mw-hidden-catlinks mw-hidden-cats-hidden" id="mw-hidden-catlinks">Hidden categories: <ul><li><a href="/wiki/Category:Articles_with_short_description" title="Category:Articles with short description">Articles with short description</a></li><li><a href="/wiki/Category:Short_description_is_different_from_Wikidata" title="Category:Short description is different from Wikidata">Short description is different from Wikidata</a></li><li><a href="/wiki/Category:Articles_needing_additional_references_from_June_2020" title="Category:Articles needing additional references from June 2020">Articles needing additional references from June 2020</a></li><li><a href="/wiki/Category:All_articles_needing_additional_references" title="Category:All articles needing additional references">All articles needing additional references</a></li></ul></div></div>
    </div>
    </main>
    </div>
    <div class="mw-footer-container">
    <footer class="mw-footer" id="footer" role="contentinfo">
    <ul id="footer-info">
    <li id="footer-info-lastmod"> This page was last edited on 3 November 2023, at 21:32<span class="anonymous-show"> (UTC)</span>.</li>
    <li id="footer-info-copyright">Text is available under the <a href="//en.wikipedia.org/wiki/Wikipedia:Text_of_the_Creative_Commons_Attribution-ShareAlike_4.0_International_License" rel="license">Creative Commons Attribution-ShareAlike License 4.0</a><a href="//en.wikipedia.org/wiki/Wikipedia:Text_of_the_Creative_Commons_Attribution-ShareAlike_4.0_International_License" rel="license" style="display:none;"></a>;
    additional terms may apply.  By using this site, you agree to the <a href="//foundation.wikimedia.org/wiki/Terms_of_Use">Terms of Use</a> and <a href="//foundation.wikimedia.org/wiki/Privacy_policy">Privacy Policy</a>. Wikipedia® is a registered trademark of the <a href="//www.wikimediafoundation.org/">Wikimedia Foundation, Inc.</a>, a non-profit organization.</li>
    </ul>
    <ul id="footer-places">
    <li id="footer-places-privacy"><a href="https://foundation.wikimedia.org/wiki/Special:MyLanguage/Policy:Privacy_policy">Privacy policy</a></li>
    <li id="footer-places-about"><a href="/wiki/Wikipedia:About">About Wikipedia</a></li>
    <li id="footer-places-disclaimers"><a href="/wiki/Wikipedia:General_disclaimer">Disclaimers</a></li>
    <li id="footer-places-contact"><a href="//en.wikipedia.org/wiki/Wikipedia:Contact_us">Contact Wikipedia</a></li>
    <li id="footer-places-wm-codeofconduct"><a href="https://foundation.wikimedia.org/wiki/Special:MyLanguage/Policy:Universal_Code_of_Conduct">Code of Conduct</a></li>
    <li id="footer-places-developers"><a href="https://developer.wikimedia.org">Developers</a></li>
    <li id="footer-places-statslink"><a href="https://stats.wikimedia.org/#/en.wikipedia.org">Statistics</a></li>
    <li id="footer-places-cookiestatement"><a href="https://foundation.wikimedia.org/wiki/Special:MyLanguage/Policy:Cookie_statement">Cookie statement</a></li>
    <li id="footer-places-mobileview"><a class="noprint stopMobileRedirectToggle" href="//en.m.wikipedia.org/w/index.php?title=List_of_largest_companies_in_the_United_States_by_revenue&amp;mobileaction=toggle_view_mobile">Mobile view</a></li>
    </ul>
    <ul class="noprint" id="footer-icons">
    <li id="footer-copyrightico"><a href="https://wikimediafoundation.org/"><img alt="Wikimedia Foundation" height="31" loading="lazy" src="/static/images/footer/wikimedia-button.png" srcset="/static/images/footer/wikimedia-button-1.5x.png 1.5x, /static/images/footer/wikimedia-button-2x.png 2x" width="88"/></a></li>
    <li id="footer-poweredbyico"><a href="https://www.mediawiki.org/"><img alt="Powered by MediaWiki" height="31" loading="lazy" src="/static/images/footer/poweredby_mediawiki_88x31.png" srcset="/static/images/footer/poweredby_mediawiki_132x47.png 1.5x, /static/images/footer/poweredby_mediawiki_176x62.png 2x" width="88"/></a></li>
    </ul>
    </footer>
    </div>
    </div>
    </div>
    <div class="vector-settings" id="p-dock-bottom">
    <ul>
    <li>
    <button class="cdx-button cdx-button--icon-only vector-limited-width-toggle" id=""><span class="vector-icon mw-ui-icon-fullScreen mw-ui-icon-wikimedia-fullScreen"></span>
    <span>Toggle limited content width</span>
    </button>
    </li>
    </ul>
    </div>
    <script>(RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgHostname":"mw1453","wgBackendResponseTime":120,"wgPageParseReport":{"limitreport":{"cputime":"0.337","walltime":"0.422","ppvisitednodes":{"value":2497,"limit":1000000},"postexpandincludesize":{"value":37471,"limit":2097152},"templateargumentsize":{"value":665,"limit":2097152},"expansiondepth":{"value":9,"limit":100},"expensivefunctioncount":{"value":1,"limit":500},"unstrip-depth":{"value":1,"limit":20},"unstrip-size":{"value":10345,"limit":5000000},"entityaccesscount":{"value":0,"limit":400},"timingprofile":["100.00%  301.549      1 -total"," 28.72%   86.591    100 Template:Ntsh"," 26.66%   80.407      1 Template:Reflist"," 22.94%   69.162      3 Template:Cite_web"," 19.30%   58.188      1 Template:More_citations_needed"," 18.41%   55.528      1 Template:Short_description"," 17.83%   53.763      1 Template:Ambox","  9.08%   27.393      2 Template:Pagetype","  5.61%   16.904      3 Template:Main_other","  5.00%   15.088      1 Template:SDcat"]},"scribunto":{"limitreport-timeusage":{"value":"0.158","limit":"10.000"},"limitreport-memusage":{"value":4320925,"limit":52428800}},"cachereport":{"origin":"mw1481","timestamp":"20231106025644","ttl":1814400,"transientcontent":false}}});});</script>
    <script type="application/ld+json">{"@context":"https:\/\/schema.org","@type":"Article","name":"List of largest companies in the United States by revenue","url":"https:\/\/en.wikipedia.org\/wiki\/List_of_largest_companies_in_the_United_States_by_revenue","sameAs":"http:\/\/www.wikidata.org\/entity\/Q1860802","mainEntity":"http:\/\/www.wikidata.org\/entity\/Q1860802","author":{"@type":"Organization","name":"Contributors to Wikimedia projects"},"publisher":{"@type":"Organization","name":"Wikimedia Foundation, Inc.","logo":{"@type":"ImageObject","url":"https:\/\/www.wikimedia.org\/static\/images\/wmf-hor-googpub.png"}},"datePublished":"2019-06-30T17:36:41Z","dateModified":"2023-11-03T21:32:45Z","headline":"Wikimedia list article"}</script>
    </body>
    </html>
    


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    Cell In[10], line 1
    ----> 1 print(soup).prettify
    

    AttributeError: 'NoneType' object has no attribute 'prettify'


### Specifying table within HTML to scrape data from and assigning specified table a variable


```python
soup.find('table', class_ = 'wikitable sortable')
```




    <table class="wikitable sortable">
    <caption>
    </caption>
    <tbody><tr>
    <th>Rank
    </th>
    <th>Name
    </th>
    <th>Industry
    </th>
    <th>Revenue <br/>(USD millions)
    </th>
    <th>Revenue growth
    </th>
    <th>Employees
    </th>
    <th>Headquarters
    </th></tr>
    <tr>
    <td>1
    </td>
    <td><a href="/wiki/Walmart" title="Walmart">Walmart</a>
    </td>
    <td><a href="/wiki/Retail" title="Retail">Retail</a>
    </td>
    <td style="text-align:center;">611,289
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.7%
    </td>
    <td style="text-align:center;">2,100,000
    </td>
    <td><a href="/wiki/Bentonville,_Arkansas" title="Bentonville, Arkansas">Bentonville, Arkansas</a>
    </td></tr>
    <tr>
    <td>2
    </td>
    <td><a href="/wiki/Amazon_(company)" title="Amazon (company)">Amazon</a>
    </td>
    <td>Retail and <a href="/wiki/Cloud_computing" title="Cloud computing">cloud computing</a>
    </td>
    <td style="text-align:center;">513,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">1,540,000
    </td>
    <td><a href="/wiki/Seattle" title="Seattle">Seattle, Washington</a>
    </td></tr>
    <tr>
    <td>3
    </td>
    <td><a href="/wiki/ExxonMobil" title="ExxonMobil">ExxonMobil</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">413,680
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 44.8%
    </td>
    <td style="text-align:center;">62,000
    </td>
    <td><a href="/wiki/Spring,_Texas" title="Spring, Texas">Spring, Texas</a>
    </td></tr>
    <tr>
    <td>4
    </td>
    <td><a class="mw-redirect" href="/wiki/Apple_Inc" title="Apple Inc">Apple</a>
    </td>
    <td><a href="/wiki/Electronics_industry" title="Electronics industry">Electronics industry</a>
    </td>
    <td style="text-align:center;">394,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 7.8%
    </td>
    <td style="text-align:center;">164,000
    </td>
    <td><a href="/wiki/Cupertino,_California" title="Cupertino, California">Cupertino, California</a>
    </td></tr>
    <tr>
    <td>5
    </td>
    <td><a href="/wiki/UnitedHealth_Group" title="UnitedHealth Group">UnitedHealth Group</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Healthcare" title="Healthcare">Healthcare</a>
    </td>
    <td style="text-align:center;">324,162
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 12.7%
    </td>
    <td style="text-align:center;">400,000
    </td>
    <td><a href="/wiki/Minnetonka,_Minnesota" title="Minnetonka, Minnesota">Minnetonka, Minnesota</a>
    </td></tr>
    <tr>
    <td>6
    </td>
    <td><a href="/wiki/CVS_Health" title="CVS Health">CVS Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">322,467
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 10.4%
    </td>
    <td style="text-align:center;">259,500
    </td>
    <td><a href="/wiki/Woonsocket,_Rhode_Island" title="Woonsocket, Rhode Island">Woonsocket, Rhode Island</a>
    </td></tr>
    <tr>
    <td>7
    </td>
    <td><a href="/wiki/Berkshire_Hathaway" title="Berkshire Hathaway">Berkshire Hathaway</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a>
    </td>
    <td style="text-align:center;">302,089
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">383,000
    </td>
    <td><a href="/wiki/Omaha,_Nebraska" title="Omaha, Nebraska">Omaha, Nebraska</a>
    </td></tr>
    <tr>
    <td>8
    </td>
    <td><a class="mw-redirect" href="/wiki/Alphabet_Inc" title="Alphabet Inc">Alphabet</a>
    </td>
    <td><a href="/wiki/Technology" title="Technology">Technology</a> and Cloud Computing
    </td>
    <td style="text-align:center;">282,836
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.8%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a href="/wiki/Mountain_View,_California" title="Mountain View, California">Mountain View, California</a>
    </td></tr>
    <tr>
    <td>9
    </td>
    <td><a href="/wiki/McKesson_Corporation" title="McKesson Corporation">McKesson Corporation</a>
    </td>
    <td>Health
    </td>
    <td style="text-align:center;">276,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.8%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/Irving,_Texas" title="Irving, Texas">Irving, Texas</a>
    </td></tr>
    <tr>
    <td>10
    </td>
    <td><a href="/wiki/Chevron_Corporation" title="Chevron Corporation">Chevron Corporation</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">246,252
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.6%
    </td>
    <td style="text-align:center;">43,846
    </td>
    <td><a href="/wiki/San_Ramon,_California" title="San Ramon, California">San Ramon, California</a>
    </td></tr>
    <tr>
    <td>11
    </td>
    <td><a class="mw-redirect" href="/wiki/AmerisourceBergen" title="AmerisourceBergen">AmerisourceBergen</a>
    </td>
    <td><a href="/wiki/Pharmaceutical_industry" title="Pharmaceutical industry">Pharmaceutical industry</a>
    </td>
    <td style="text-align:center;">238,587
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.5%
    </td>
    <td style="text-align:center;">41,500
    </td>
    <td><a href="/wiki/Chesterbrook,_Pennsylvania" title="Chesterbrook, Pennsylvania">Chesterbrook, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>12
    </td>
    <td><a href="/wiki/Costco" title="Costco">Costco</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">226,954
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">304,000
    </td>
    <td><a href="/wiki/Issaquah,_Washington" title="Issaquah, Washington">Issaquah, Washington</a>
    </td></tr>
    <tr>
    <td>13
    </td>
    <td><a href="/wiki/Microsoft" title="Microsoft">Microsoft</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">198,270
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 18.0%
    </td>
    <td style="text-align:center;">221,000
    </td>
    <td><a href="/wiki/Redmond,_Washington" title="Redmond, Washington">Redmond, Washington</a>
    </td></tr>
    <tr>
    <td>14
    </td>
    <td><a href="/wiki/Cardinal_Health" title="Cardinal Health">Cardinal Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">181,364
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.6%
    </td>
    <td style="text-align:center;">46,035
    </td>
    <td><a href="/wiki/Dublin,_Ohio" title="Dublin, Ohio">Dublin, Ohio</a>
    </td></tr>
    <tr>
    <td>15
    </td>
    <td><a href="/wiki/Cigna" title="Cigna">Cigna</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">180,516
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.7%
    </td>
    <td style="text-align:center;">70,231
    </td>
    <td><a href="/wiki/Bloomfield,_Connecticut" title="Bloomfield, Connecticut">Bloomfield, Connecticut</a>
    </td></tr>
    <tr>
    <td>16
    </td>
    <td><a href="/wiki/Marathon_Petroleum" title="Marathon Petroleum">Marathon Petroleum</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">180,012
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.6%
    </td>
    <td style="text-align:center;">17,800
    </td>
    <td><a href="/wiki/Findlay,_Ohio" title="Findlay, Ohio">Findlay, Ohio</a>
    </td></tr>
    <tr>
    <td>17
    </td>
    <td><a href="/wiki/Phillips_66" title="Phillips 66">Phillips 66</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">175,702
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 53.0%
    </td>
    <td style="text-align:center;">13,000
    </td>
    <td><a href="/wiki/Houston" title="Houston">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>18
    </td>
    <td><a href="/wiki/Valero_Energy" title="Valero Energy">Valero Energy</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">171,189
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 58.0%
    </td>
    <td style="text-align:center;">9,743
    </td>
    <td><a href="/wiki/San_Antonio" title="San Antonio">San Antonio, Texas</a>
    </td></tr>
    <tr>
    <td>19
    </td>
    <td><a href="/wiki/Ford_Motor_Company" title="Ford Motor Company">Ford Motor Company</a>
    </td>
    <td><a href="/wiki/Automotive_industry" title="Automotive industry">Automotive industry</a>
    </td>
    <td style="text-align:center;">158,057
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.9%
    </td>
    <td style="text-align:center;">173,000
    </td>
    <td><a href="/wiki/Dearborn,_Michigan" title="Dearborn, Michigan">Dearborn, Michigan</a>
    </td></tr>
    <tr>
    <td>20
    </td>
    <td><a href="/wiki/The_Home_Depot" title="The Home Depot">The Home Depot</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">157,403
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.1%
    </td>
    <td style="text-align:center;">471,600
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>21
    </td>
    <td><a href="/wiki/General_Motors" title="General Motors">General Motors</a>
    </td>
    <td>Automotive industry
    </td>
    <td style="text-align:center;">156,735
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">167,000
    </td>
    <td><a href="/wiki/Detroit" title="Detroit">Detroit, Michigan</a>
    </td></tr>
    <tr>
    <td>22
    </td>
    <td><a class="mw-redirect" href="/wiki/Anthem_(company)" title="Anthem (company)">Elevance Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">156,595
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.0%
    </td>
    <td style="text-align:center;">102,200
    </td>
    <td><a href="/wiki/Indianapolis" title="Indianapolis">Indianapolis, Indiana</a>
    </td></tr>
    <tr>
    <td>23
    </td>
    <td><a href="/wiki/JPMorgan_Chase" title="JPMorgan Chase">JPMorgan Chase</a>
    </td>
    <td><a href="/wiki/Financial_services" title="Financial services">Financial services</a>
    </td>
    <td style="text-align:center;">154,792
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 21.7%
    </td>
    <td style="text-align:center;">293,723
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>24
    </td>
    <td><a href="/wiki/Kroger" title="Kroger">Kroger</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">148,258
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.5%
    </td>
    <td style="text-align:center;">430,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>25
    </td>
    <td><a class="mw-redirect" href="/wiki/Centene" title="Centene">Centene</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">144,547
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.7%
    </td>
    <td style="text-align:center;">74,300
    </td>
    <td><a href="/wiki/St._Louis" title="St. Louis">St. Louis, Missouri</a>
    </td></tr>
    <tr>
    <td>26
    </td>
    <td><a href="/wiki/Verizon_Communications" title="Verizon Communications">Verizon Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">136,835
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.4%
    </td>
    <td style="text-align:center;">117,100
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>27
    </td>
    <td><a href="/wiki/Walgreens_Boots_Alliance" title="Walgreens Boots Alliance">Walgreens Boots Alliance</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">132,703
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.7%
    </td>
    <td style="text-align:center;">262,500
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>28
    </td>
    <td><a href="/wiki/Fannie_Mae" title="Fannie Mae">Fannie Mae</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">121,596
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.7%
    </td>
    <td style="text-align:center;">8,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>29
    </td>
    <td><a href="/wiki/Comcast" title="Comcast">Comcast</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">121,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.3%
    </td>
    <td style="text-align:center;">186,000
    </td>
    <td><a href="/wiki/Philadelphia" title="Philadelphia">Philadelphia, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>30
    </td>
    <td><a href="/wiki/AT%26T" title="AT&amp;T">AT&amp;T</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a> and Telecomunications
    </td>
    <td style="text-align:center;">120,741
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 28.5%
    </td>
    <td style="text-align:center;">160,700
    </td>
    <td><a href="/wiki/Dallas" title="Dallas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>31
    </td>
    <td><a href="/wiki/Meta_Platforms" title="Meta Platforms">Meta Platforms</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">116,609
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.1%
    </td>
    <td style="text-align:center;">86,482
    </td>
    <td><a href="/wiki/Menlo_Park,_California" title="Menlo Park, California">Menlo Park, California</a>
    </td></tr>
    <tr>
    <td>32
    </td>
    <td><a href="/wiki/Bank_of_America" title="Bank of America">Bank of America</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">115,053
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.6%
    </td>
    <td style="text-align:center;">216,823
    </td>
    <td><a href="/wiki/Charlotte,_North_Carolina" title="Charlotte, North Carolina">Charlotte, North Carolina</a>
    </td></tr>
    <tr>
    <td>33
    </td>
    <td><a href="/wiki/Target_Corporation" title="Target Corporation">Target Corporation</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">109,120
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">440,000
    </td>
    <td><a href="/wiki/Minneapolis" title="Minneapolis">Minneapolis, Minnesota</a>
    </td></tr>
    <tr>
    <td>34
    </td>
    <td><a href="/wiki/Dell_Technologies" title="Dell Technologies">Dell Technologies</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">102,301
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 4.4%
    </td>
    <td style="text-align:center;">133,000
    </td>
    <td><a href="/wiki/Round_Rock,_Texas" title="Round Rock, Texas">Round Rock, Texas</a>
    </td></tr>
    <tr>
    <td>35
    </td>
    <td><a class="mw-redirect" href="/wiki/Archer_Daniels_Midland" title="Archer Daniels Midland">Archer Daniels Midland</a>
    </td>
    <td><a href="/wiki/Food_industry" title="Food industry">Food industry</a>
    </td>
    <td style="text-align:center;">101,556
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.1%
    </td>
    <td style="text-align:center;">41,181
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago,_Illinois" title="Chicago, Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>36
    </td>
    <td><a href="/wiki/Citigroup" title="Citigroup">Citigroup</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">101,078
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 26.6%
    </td>
    <td style="text-align:center;">238,104
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>37
    </td>
    <td><a href="/wiki/United_Parcel_Service" title="United Parcel Service">United Parcel Service</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Transportation" title="Transportation">Transportation</a>
    </td>
    <td style="text-align:center;">100,338
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.1%
    </td>
    <td style="text-align:center;">404,700
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>38
    </td>
    <td><a href="/wiki/Pfizer" title="Pfizer">Pfizer</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">100,330
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">83,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>39
    </td>
    <td><a href="/wiki/Lowe%27s" title="Lowe's">Lowe's</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">97,059
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">244,500
    </td>
    <td><a href="/wiki/Mooresville,_North_Carolina" title="Mooresville, North Carolina">Mooresville, North Carolina</a>
    </td></tr>
    <tr>
    <td>40
    </td>
    <td><a href="/wiki/Johnson_%26_Johnson" title="Johnson &amp; Johnson">Johnson &amp; Johnson</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">94,943
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 1.2%
    </td>
    <td style="text-align:center;">152,700
    </td>
    <td><a href="/wiki/New_Brunswick,_New_Jersey" title="New Brunswick, New Jersey">New Brunswick, New Jersey</a>
    </td></tr>
    <tr>
    <td>41
    </td>
    <td><a href="/wiki/FedEx" title="FedEx">FedEx</a>
    </td>
    <td>Transportation
    </td>
    <td style="text-align:center;">93,512
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.4%
    </td>
    <td style="text-align:center;">518,249
    </td>
    <td><a href="/wiki/Memphis,_Tennessee" title="Memphis, Tennessee">Memphis, Tennessee</a>
    </td></tr>
    <tr>
    <td>42
    </td>
    <td><a href="/wiki/Humana" title="Humana">Humana</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">92,870
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.8%
    </td>
    <td style="text-align:center;">67,100
    </td>
    <td><a href="/wiki/Louisville,_Kentucky" title="Louisville, Kentucky">Louisville, Kentucky</a>
    </td></tr>
    <tr>
    <td>43
    </td>
    <td><a href="/wiki/Energy_Transfer_Partners" title="Energy Transfer Partners">Energy Transfer Partners</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">89,876
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.3%
    </td>
    <td style="text-align:center;">12,565
    </td>
    <td><a class="mw-redirect" href="/wiki/Dallas,_Texas" title="Dallas, Texas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>44
    </td>
    <td><a href="/wiki/State_Farm" title="State Farm">State Farm</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">89,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">60,519
    </td>
    <td><a href="/wiki/Bloomington,_Illinois" title="Bloomington, Illinois">Bloomington, Illinois</a>
    </td></tr>
    <tr>
    <td>45
    </td>
    <td><a href="/wiki/Freddie_Mac" title="Freddie Mac">Freddie Mac</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">86,717
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.6%
    </td>
    <td style="text-align:center;">7,819
    </td>
    <td><a href="/wiki/McLean,_Virginia" title="McLean, Virginia">McLean, Virginia</a>
    </td></tr>
    <tr>
    <td>46
    </td>
    <td><a href="/wiki/PepsiCo" title="PepsiCo">PepsiCo</a>
    </td>
    <td><a href="/wiki/Drink" title="Drink">Beverage</a>
    </td>
    <td style="text-align:center;">86,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.7%
    </td>
    <td style="text-align:center;">315,000
    </td>
    <td><a href="/wiki/Purchase,_New_York" title="Purchase, New York">Purchase, New York</a>
    </td></tr>
    <tr>
    <td>47
    </td>
    <td><a href="/wiki/Wells_Fargo" title="Wells Fargo">Wells Fargo</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">82,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">238,000
    </td>
    <td><a href="/wiki/San_Francisco" title="San Francisco">San Francisco, California</a>
    </td></tr>
    <tr>
    <td>48
    </td>
    <td><a href="/wiki/The_Walt_Disney_Company" title="The Walt Disney Company">The Walt Disney Company</a>
    </td>
    <td>Media
    </td>
    <td style="text-align:center;">82,722
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.7%
    </td>
    <td style="text-align:center;">195,800
    </td>
    <td><a href="/wiki/Burbank,_California" title="Burbank, California">Burbank, California</a>
    </td></tr>
    <tr>
    <td>49
    </td>
    <td><a href="/wiki/ConocoPhillips" title="ConocoPhillips">ConocoPhillips</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">82,156
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 69.9%
    </td>
    <td style="text-align:center;">9,500
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>50
    </td>
    <td><a class="mw-redirect" href="/wiki/Tesla_Inc" title="Tesla Inc">Tesla</a>
    </td>
    <td>Automotive and Energy
    </td>
    <td style="text-align:center;">81,462
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.4%
    </td>
    <td style="text-align:center;">127,855
    </td>
    <td><a href="/wiki/Austin,_Texas" title="Austin, Texas">Austin, Texas</a>
    </td></tr>
    <tr>
    <td>51
    </td>
    <td><a href="/wiki/Procter_%26_Gamble" title="Procter &amp; Gamble">Procter &amp; Gamble</a>
    </td>
    <td>Consumer products Manufacturing
    </td>
    <td style="text-align:center;">80,187
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.3%
    </td>
    <td style="text-align:center;">106,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>52
    </td>
    <td><a href="/wiki/United_States_Postal_Service" title="United States Postal Service">United States Postal Service</a>
    </td>
    <td>Logistics
    </td>
    <td style="text-align:center;">78,620
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 2.0%
    </td>
    <td style="text-align:center;">576,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>53
    </td>
    <td><a href="/wiki/Albertsons" title="Albertsons">Albertsons</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">77,650
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.0%
    </td>
    <td style="text-align:center;">198,650
    </td>
    <td><a href="/wiki/Boise,_Idaho" title="Boise, Idaho">Boise, Idaho</a>
    </td></tr>
    <tr>
    <td>54
    </td>
    <td><a href="/wiki/General_Electric" title="General Electric">General Electric</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">76,555
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 3.2%
    </td>
    <td style="text-align:center;">172,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>55
    </td>
    <td><a href="/wiki/MetLife" title="MetLife">MetLife</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">69,898
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.7%
    </td>
    <td style="text-align:center;">45,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>56
    </td>
    <td><a href="/wiki/Goldman_Sachs" title="Goldman Sachs">Goldman Sachs</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">68,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.7%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>57
    </td>
    <td><a href="/wiki/Sysco" title="Sysco">Sysco</a>
    </td>
    <td>Food Service
    </td>
    <td style="text-align:center;">68,636
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.8%
    </td>
    <td style="text-align:center;">70,510
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>58
    </td>
    <td><a class="mw-redirect" href="/wiki/Bunge_Limited" title="Bunge Limited">Bunge Limited</a>
    </td>
    <td>Food industry
    </td>
    <td style="text-align:center;">67,232
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.7%
    </td>
    <td style="text-align:center;">23,000
    </td>
    <td><a href="/wiki/White_Plains,_New_York" title="White Plains, New York">White Plains, New York</a>
    </td></tr>
    <tr>
    <td>59
    </td>
    <td><a href="/wiki/RTX_Corporation" title="RTX Corporation">RTX Corporation</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">67,074
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.2%
    </td>
    <td style="text-align:center;">182,000
    </td>
    <td><a href="/wiki/Arlington_County,_Virginia" title="Arlington County, Virginia">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>60
    </td>
    <td><a href="/wiki/Boeing" title="Boeing">Boeing</a>
    </td>
    <td><a href="/wiki/Aerospace_engineering" title="Aerospace engineering">Aerospace</a> and <a href="/wiki/Arms_industry" title="Arms industry">defense</a>
    </td>
    <td style="text-align:center;">66,608
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.9%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Arlington_County" title="Arlington County">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>61
    </td>
    <td><a class="mw-redirect" href="/wiki/StoneX_Group" title="StoneX Group">StoneX Group</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">66,036
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 55.3%
    </td>
    <td style="text-align:center;">305
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>62
    </td>
    <td><a href="/wiki/Lockheed_Martin" title="Lockheed Martin">Lockheed Martin</a>
    </td>
    <td>Aerospace and Defense
    </td>
    <td style="text-align:center;">65,984
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.6%
    </td>
    <td style="text-align:center;">116,000
    </td>
    <td><a href="/wiki/Bethesda,_Maryland" title="Bethesda, Maryland">Bethesda, Maryland</a>
    </td></tr>
    <tr>
    <td>63
    </td>
    <td><a href="/wiki/Morgan_Stanley" title="Morgan Stanley">Morgan Stanley</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">65,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.9%
    </td>
    <td style="text-align:center;">82,427
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>64
    </td>
    <td><a href="/wiki/Intel" title="Intel">Intel</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">63,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 20.1%
    </td>
    <td style="text-align:center;">131,900
    </td>
    <td><a href="/wiki/Santa_Clara,_California" title="Santa Clara, California">Santa Clara, California</a>
    </td></tr>
    <tr>
    <td>65
    </td>
    <td><a class="mw-redirect" href="/wiki/HP_Inc" title="HP Inc">HP</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">62,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">58,000
    </td>
    <td><a href="/wiki/Palo_Alto,_California" title="Palo Alto, California">Palo Alto, California</a>
    </td></tr>
    <tr>
    <td>66
    </td>
    <td><a href="/wiki/TD_Synnex" title="TD Synnex">TD Synnex</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Infotech" title="Infotech">Infotech</a>
    </td>
    <td style="text-align:center;">62,344
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 97.2%
    </td>
    <td style="text-align:center;">28,500
    </td>
    <td><a href="/wiki/Clearwater,_Florida" title="Clearwater, Florida">Clearwater, Florida</a>
    </td></tr>
    <tr>
    <td>67
    </td>
    <td><a href="/wiki/IBM" title="IBM">IBM</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">60,530
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 16.3%
    </td>
    <td style="text-align:center;">303,100
    </td>
    <td><a href="/wiki/Armonk,_New_York" title="Armonk, New York">Armonk, New York</a>
    </td></tr>
    <tr>
    <td>68
    </td>
    <td><a href="/wiki/HCA_Healthcare" title="HCA Healthcare">HCA Healthcare</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">60,233
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.5%
    </td>
    <td style="text-align:center;">250,500
    </td>
    <td><a href="/wiki/Nashville,_Tennessee" title="Nashville, Tennessee">Nashville, Tennessee</a>
    </td></tr>
    <tr>
    <td>69
    </td>
    <td><a href="/wiki/Prudential_Financial" title="Prudential Financial">Prudential Financial</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">60,050
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 15.3%
    </td>
    <td style="text-align:center;">39,583
    </td>
    <td><a href="/wiki/Newark,_New_Jersey" title="Newark, New Jersey">Newark, New Jersey</a>
    </td></tr>
    <tr>
    <td>70
    </td>
    <td><a class="mw-redirect" href="/wiki/Caterpillar_Inc" title="Caterpillar Inc">Caterpillar</a>
    </td>
    <td>Machinery
    </td>
    <td style="text-align:center;">59,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 16.6%
    </td>
    <td style="text-align:center;">109,100
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>71
    </td>
    <td><a href="/wiki/Merck_%26_Co." title="Merck &amp; Co.">Merck &amp; Co.</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">59,283
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">68,000
    </td>
    <td><a href="/wiki/Kenilworth,_New_Jersey" title="Kenilworth, New Jersey">Kenilworth, New Jersey</a>
    </td></tr>
    <tr>
    <td>72
    </td>
    <td><a class="mw-redirect" href="/wiki/World_Fuel_Services" title="World Fuel Services">World Fuel Services</a>
    </td>
    <td>Petroleum industry and Logistics
    </td>
    <td style="text-align:center;">59,043
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 88.4%
    </td>
    <td style="text-align:center;">5,214
    </td>
    <td><a class="mw-redirect" href="/wiki/Miami,_Florida" title="Miami, Florida">Miami, Florida</a>
    </td></tr>
    <tr>
    <td>73
    </td>
    <td><a href="/wiki/New_York_Life_Insurance_Company" title="New York Life Insurance Company">New York Life Insurance Company</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">58,445
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.2%
    </td>
    <td style="text-align:center;">15,050
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>74
    </td>
    <td><a href="/wiki/Enterprise_Products" title="Enterprise Products">Enterprise Products</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">58,186
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 42.6%
    </td>
    <td style="text-align:center;">7,300
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>75
    </td>
    <td><a href="/wiki/AbbVie" title="AbbVie">AbbVie</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">58,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.3%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Lake_Bluff,_Illinois" title="Lake Bluff, Illinois">Lake Bluff, Illinois</a>
    </td></tr>
    <tr>
    <td>76
    </td>
    <td><a href="/wiki/Plains_All_American_Pipeline" title="Plains All American Pipeline">Plains All American Pipeline</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">57,342
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 36.3%
    </td>
    <td style="text-align:center;">4,100
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>77
    </td>
    <td><a href="/wiki/Dow_Chemical_Company" title="Dow Chemical Company">Dow Chemical Company</a>
    </td>
    <td><a href="/wiki/Chemical_industry" title="Chemical industry">Chemical industry</a>
    </td>
    <td style="text-align:center;">56,902
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">37,800
    </td>
    <td><a href="/wiki/Midland,_Michigan" title="Midland, Michigan">Midland, Michigan</a>
    </td></tr>
    <tr>
    <td>78
    </td>
    <td><a class="mw-redirect" href="/wiki/AIG" title="AIG">AIG</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">56,437
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.4%
    </td>
    <td style="text-align:center;">26,200
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>79
    </td>
    <td><a href="/wiki/American_Express" title="American Express">American Express</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">55,625
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.3%
    </td>
    <td style="text-align:center;">77,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>80
    </td>
    <td><a href="/wiki/Publix" title="Publix">Publix</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">54,942
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.5%
    </td>
    <td style="text-align:center;">242,000
    </td>
    <td><a href="/wiki/Lakeland,_Florida" title="Lakeland, Florida">Lakeland, Florida</a>
    </td></tr>
    <tr>
    <td>81
    </td>
    <td><a href="/wiki/Charter_Communications" title="Charter Communications">Charter Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">54,022
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.5%
    </td>
    <td style="text-align:center;">101,700
    </td>
    <td><a href="/wiki/Stamford,_Connecticut" title="Stamford, Connecticut">Stamford, Connecticut</a>
    </td></tr>
    <tr>
    <td>82
    </td>
    <td><a href="/wiki/Tyson_Foods" title="Tyson Foods">Tyson Foods</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">53,282
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.2%
    </td>
    <td style="text-align:center;">142,000
    </td>
    <td><a href="/wiki/Springdale,_Arkansas" title="Springdale, Arkansas">Springdale, Arkansas</a>
    </td></tr>
    <tr>
    <td>83
    </td>
    <td><a href="/wiki/John_Deere" title="John Deere">John Deere</a>
    </td>
    <td>Agriculture manufacturing
    </td>
    <td style="text-align:center;">52,577
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.4%
    </td>
    <td style="text-align:center;">82,239
    </td>
    <td><a href="/wiki/Moline,_Illinois" title="Moline, Illinois">Moline, Illinois</a>
    </td></tr>
    <tr>
    <td>84
    </td>
    <td><a href="/wiki/Cisco" title="Cisco">Cisco</a>
    </td>
    <td>Telecom Hardware Manufacturing
    </td>
    <td style="text-align:center;">51,557
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">83,300
    </td>
    <td><a href="/wiki/San_Jose,_California" title="San Jose, California">San Jose, California</a>
    </td></tr>
    <tr>
    <td>85
    </td>
    <td><a href="/wiki/Nationwide_Mutual_Insurance_Company" title="Nationwide Mutual Insurance Company">Nationwide Mutual Insurance Company</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">51,450
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">24,791
    </td>
    <td><a href="/wiki/Columbus,_Ohio" title="Columbus, Ohio">Columbus, Ohio</a>
    </td></tr>
    <tr>
    <td>86
    </td>
    <td><a href="/wiki/Allstate" title="Allstate">Allstate</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">51,412
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 3.4%
    </td>
    <td style="text-align:center;">54,250
    </td>
    <td><a href="/wiki/Northfield_Township,_Cook_County,_Illinois" title="Northfield Township, Cook County, Illinois">Northfield Township, Cook County, Illinois</a>
    </td></tr>
    <tr>
    <td>87
    </td>
    <td><a href="/wiki/Delta_Air_Lines" title="Delta Air Lines">Delta Air Lines</a>
    </td>
    <td><a href="/wiki/Airline" title="Airline">Airline</a>
    </td>
    <td style="text-align:center;">50,582
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000400000000000000♠" style="display:none"></span> 69.2%
    </td>
    <td style="text-align:center;">95,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Atlanta_Georgia" title="Atlanta Georgia">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>88
    </td>
    <td><a href="/wiki/Liberty_Mutual" title="Liberty Mutual">Liberty Mutual</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,956
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.6%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>89
    </td>
    <td><a class="mw-redirect" href="/wiki/TJX" title="TJX">TJX</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">49,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">329,000
    </td>
    <td><a href="/wiki/Framingham,_Massachusetts" title="Framingham, Massachusetts">Framingham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>90
    </td>
    <td><a href="/wiki/Progressive_Corporation" title="Progressive Corporation">Progressive Corporation</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,611
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.0%
    </td>
    <td style="text-align:center;">55,063
    </td>
    <td><a class="mw-redirect" href="/wiki/Mayfield_Village,_Ohio" title="Mayfield Village, Ohio">Mayfield Village, Ohio</a>
    </td></tr>
    <tr>
    <td>91
    </td>
    <td><a href="/wiki/American_Airlines" title="American Airlines">American Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">48,971
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 63.9%
    </td>
    <td style="text-align:center;">129,700
    </td>
    <td><a href="/wiki/Fort_Worth,_Texas" title="Fort Worth, Texas">Fort Worth, Texas</a>
    </td></tr>
    <tr>
    <td>92
    </td>
    <td><a class="mw-redirect" href="/wiki/CHS_Inc" title="CHS Inc">CHS</a>
    </td>
    <td>Agriculture cooperative
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 24.3%
    </td>
    <td style="text-align:center;">10,014
    </td>
    <td><a class="mw-redirect" href="/wiki/Inver_Grove_Heights" title="Inver Grove Heights">Inver Grove Heights, Minnesota</a>
    </td></tr>
    <tr>
    <td>93
    </td>
    <td><a href="/wiki/Performance_Food_Group" title="Performance Food Group">Performance Food Group</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 61.6%
    </td>
    <td style="text-align:center;">34,825
    </td>
    <td><a href="/wiki/Richmond,_Virginia" title="Richmond, Virginia">Richmond, Virginia</a>
    </td></tr>
    <tr>
    <td>94
    </td>
    <td><a href="/wiki/PBF_Energy" title="PBF Energy">PBF Energy</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">46,830
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 71.8%
    </td>
    <td style="text-align:center;">3,616
    </td>
    <td><a href="/wiki/Parsippany%E2%80%93Troy_Hills,_New_Jersey" title="Parsippany–Troy Hills, New Jersey">Parsippany–Troy Hills, New Jersey</a>
    </td></tr>
    <tr>
    <td>95
    </td>
    <td><a class="mw-redirect" href="/wiki/Nike_Inc" title="Nike Inc">Nike</a>
    </td>
    <td>Apparel
    </td>
    <td style="text-align:center;">46,710
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.9%
    </td>
    <td style="text-align:center;">79,100
    </td>
    <td><a href="/wiki/Beaverton,_Oregon" title="Beaverton, Oregon">Beaverton, Oregon</a>
    </td></tr>
    <tr>
    <td>96
    </td>
    <td><a href="/wiki/Best_Buy" title="Best Buy">Best Buy</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">46,298
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.6%
    </td>
    <td style="text-align:center;">71,100
    </td>
    <td><a href="/wiki/Richfield,_Minnesota" title="Richfield, Minnesota">Richfield, Minnesota</a>
    </td></tr>
    <tr>
    <td>97
    </td>
    <td><a class="mw-redirect" href="/wiki/Bristol-Myers_Squibb" title="Bristol-Myers Squibb">Bristol-Myers Squibb</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">46,159
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">34,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City</a>, <a href="/wiki/New_York_(state)" title="New York (state)">New York</a>
    </td></tr>
    <tr>
    <td>98
    </td>
    <td><a href="/wiki/United_Airlines" title="United Airlines">United Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">44,955
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 82.5%
    </td>
    <td style="text-align:center;">92,795
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago_Illinois" title="Chicago Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>99
    </td>
    <td><a href="/wiki/Thermo_Fisher_Scientific" title="Thermo Fisher Scientific">Thermo Fisher Scientific</a>
    </td>
    <td>Laboratory instruments
    </td>
    <td style="text-align:center;">44,915
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.5%
    </td>
    <td style="text-align:center;">130,000
    </td>
    <td><a href="/wiki/Waltham,_Massachusetts" title="Waltham, Massachusetts">Waltham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>100
    </td>
    <td><a href="/wiki/Qualcomm" title="Qualcomm">Qualcomm</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">44,200
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.7%
    </td>
    <td style="text-align:center;">51,000
    </td>
    <td><a class="mw-redirect" href="/wiki/San_Diego,_Calif." title="San Diego, Calif.">San Diego, California</a>
    </td></tr></tbody></table>




```python
table = soup.find('table', class_ = 'wikitable sortable')
```


```python
print(table)
```

    <table class="wikitable sortable">
    <caption>
    </caption>
    <tbody><tr>
    <th>Rank
    </th>
    <th>Name
    </th>
    <th>Industry
    </th>
    <th>Revenue <br/>(USD millions)
    </th>
    <th>Revenue growth
    </th>
    <th>Employees
    </th>
    <th>Headquarters
    </th></tr>
    <tr>
    <td>1
    </td>
    <td><a href="/wiki/Walmart" title="Walmart">Walmart</a>
    </td>
    <td><a href="/wiki/Retail" title="Retail">Retail</a>
    </td>
    <td style="text-align:center;">611,289
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.7%
    </td>
    <td style="text-align:center;">2,100,000
    </td>
    <td><a href="/wiki/Bentonville,_Arkansas" title="Bentonville, Arkansas">Bentonville, Arkansas</a>
    </td></tr>
    <tr>
    <td>2
    </td>
    <td><a href="/wiki/Amazon_(company)" title="Amazon (company)">Amazon</a>
    </td>
    <td>Retail and <a href="/wiki/Cloud_computing" title="Cloud computing">cloud computing</a>
    </td>
    <td style="text-align:center;">513,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">1,540,000
    </td>
    <td><a href="/wiki/Seattle" title="Seattle">Seattle, Washington</a>
    </td></tr>
    <tr>
    <td>3
    </td>
    <td><a href="/wiki/ExxonMobil" title="ExxonMobil">ExxonMobil</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">413,680
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 44.8%
    </td>
    <td style="text-align:center;">62,000
    </td>
    <td><a href="/wiki/Spring,_Texas" title="Spring, Texas">Spring, Texas</a>
    </td></tr>
    <tr>
    <td>4
    </td>
    <td><a class="mw-redirect" href="/wiki/Apple_Inc" title="Apple Inc">Apple</a>
    </td>
    <td><a href="/wiki/Electronics_industry" title="Electronics industry">Electronics industry</a>
    </td>
    <td style="text-align:center;">394,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 7.8%
    </td>
    <td style="text-align:center;">164,000
    </td>
    <td><a href="/wiki/Cupertino,_California" title="Cupertino, California">Cupertino, California</a>
    </td></tr>
    <tr>
    <td>5
    </td>
    <td><a href="/wiki/UnitedHealth_Group" title="UnitedHealth Group">UnitedHealth Group</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Healthcare" title="Healthcare">Healthcare</a>
    </td>
    <td style="text-align:center;">324,162
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 12.7%
    </td>
    <td style="text-align:center;">400,000
    </td>
    <td><a href="/wiki/Minnetonka,_Minnesota" title="Minnetonka, Minnesota">Minnetonka, Minnesota</a>
    </td></tr>
    <tr>
    <td>6
    </td>
    <td><a href="/wiki/CVS_Health" title="CVS Health">CVS Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">322,467
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 10.4%
    </td>
    <td style="text-align:center;">259,500
    </td>
    <td><a href="/wiki/Woonsocket,_Rhode_Island" title="Woonsocket, Rhode Island">Woonsocket, Rhode Island</a>
    </td></tr>
    <tr>
    <td>7
    </td>
    <td><a href="/wiki/Berkshire_Hathaway" title="Berkshire Hathaway">Berkshire Hathaway</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a>
    </td>
    <td style="text-align:center;">302,089
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.4%
    </td>
    <td style="text-align:center;">383,000
    </td>
    <td><a href="/wiki/Omaha,_Nebraska" title="Omaha, Nebraska">Omaha, Nebraska</a>
    </td></tr>
    <tr>
    <td>8
    </td>
    <td><a class="mw-redirect" href="/wiki/Alphabet_Inc" title="Alphabet Inc">Alphabet</a>
    </td>
    <td><a href="/wiki/Technology" title="Technology">Technology</a> and Cloud Computing
    </td>
    <td style="text-align:center;">282,836
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 9.8%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a href="/wiki/Mountain_View,_California" title="Mountain View, California">Mountain View, California</a>
    </td></tr>
    <tr>
    <td>9
    </td>
    <td><a href="/wiki/McKesson_Corporation" title="McKesson Corporation">McKesson Corporation</a>
    </td>
    <td>Health
    </td>
    <td style="text-align:center;">276,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.8%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/Irving,_Texas" title="Irving, Texas">Irving, Texas</a>
    </td></tr>
    <tr>
    <td>10
    </td>
    <td><a href="/wiki/Chevron_Corporation" title="Chevron Corporation">Chevron Corporation</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">246,252
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.6%
    </td>
    <td style="text-align:center;">43,846
    </td>
    <td><a href="/wiki/San_Ramon,_California" title="San Ramon, California">San Ramon, California</a>
    </td></tr>
    <tr>
    <td>11
    </td>
    <td><a class="mw-redirect" href="/wiki/AmerisourceBergen" title="AmerisourceBergen">AmerisourceBergen</a>
    </td>
    <td><a href="/wiki/Pharmaceutical_industry" title="Pharmaceutical industry">Pharmaceutical industry</a>
    </td>
    <td style="text-align:center;">238,587
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.5%
    </td>
    <td style="text-align:center;">41,500
    </td>
    <td><a href="/wiki/Chesterbrook,_Pennsylvania" title="Chesterbrook, Pennsylvania">Chesterbrook, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>12
    </td>
    <td><a href="/wiki/Costco" title="Costco">Costco</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">226,954
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">304,000
    </td>
    <td><a href="/wiki/Issaquah,_Washington" title="Issaquah, Washington">Issaquah, Washington</a>
    </td></tr>
    <tr>
    <td>13
    </td>
    <td><a href="/wiki/Microsoft" title="Microsoft">Microsoft</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">198,270
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 18.0%
    </td>
    <td style="text-align:center;">221,000
    </td>
    <td><a href="/wiki/Redmond,_Washington" title="Redmond, Washington">Redmond, Washington</a>
    </td></tr>
    <tr>
    <td>14
    </td>
    <td><a href="/wiki/Cardinal_Health" title="Cardinal Health">Cardinal Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">181,364
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.6%
    </td>
    <td style="text-align:center;">46,035
    </td>
    <td><a href="/wiki/Dublin,_Ohio" title="Dublin, Ohio">Dublin, Ohio</a>
    </td></tr>
    <tr>
    <td>15
    </td>
    <td><a href="/wiki/Cigna" title="Cigna">Cigna</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">180,516
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.7%
    </td>
    <td style="text-align:center;">70,231
    </td>
    <td><a href="/wiki/Bloomfield,_Connecticut" title="Bloomfield, Connecticut">Bloomfield, Connecticut</a>
    </td></tr>
    <tr>
    <td>16
    </td>
    <td><a href="/wiki/Marathon_Petroleum" title="Marathon Petroleum">Marathon Petroleum</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">180,012
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.6%
    </td>
    <td style="text-align:center;">17,800
    </td>
    <td><a href="/wiki/Findlay,_Ohio" title="Findlay, Ohio">Findlay, Ohio</a>
    </td></tr>
    <tr>
    <td>17
    </td>
    <td><a href="/wiki/Phillips_66" title="Phillips 66">Phillips 66</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">175,702
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 53.0%
    </td>
    <td style="text-align:center;">13,000
    </td>
    <td><a href="/wiki/Houston" title="Houston">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>18
    </td>
    <td><a href="/wiki/Valero_Energy" title="Valero Energy">Valero Energy</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">171,189
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 58.0%
    </td>
    <td style="text-align:center;">9,743
    </td>
    <td><a href="/wiki/San_Antonio" title="San Antonio">San Antonio, Texas</a>
    </td></tr>
    <tr>
    <td>19
    </td>
    <td><a href="/wiki/Ford_Motor_Company" title="Ford Motor Company">Ford Motor Company</a>
    </td>
    <td><a href="/wiki/Automotive_industry" title="Automotive industry">Automotive industry</a>
    </td>
    <td style="text-align:center;">158,057
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.9%
    </td>
    <td style="text-align:center;">173,000
    </td>
    <td><a href="/wiki/Dearborn,_Michigan" title="Dearborn, Michigan">Dearborn, Michigan</a>
    </td></tr>
    <tr>
    <td>20
    </td>
    <td><a href="/wiki/The_Home_Depot" title="The Home Depot">The Home Depot</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">157,403
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.1%
    </td>
    <td style="text-align:center;">471,600
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>21
    </td>
    <td><a href="/wiki/General_Motors" title="General Motors">General Motors</a>
    </td>
    <td>Automotive industry
    </td>
    <td style="text-align:center;">156,735
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">167,000
    </td>
    <td><a href="/wiki/Detroit" title="Detroit">Detroit, Michigan</a>
    </td></tr>
    <tr>
    <td>22
    </td>
    <td><a class="mw-redirect" href="/wiki/Anthem_(company)" title="Anthem (company)">Elevance Health</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">156,595
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.0%
    </td>
    <td style="text-align:center;">102,200
    </td>
    <td><a href="/wiki/Indianapolis" title="Indianapolis">Indianapolis, Indiana</a>
    </td></tr>
    <tr>
    <td>23
    </td>
    <td><a href="/wiki/JPMorgan_Chase" title="JPMorgan Chase">JPMorgan Chase</a>
    </td>
    <td><a href="/wiki/Financial_services" title="Financial services">Financial services</a>
    </td>
    <td style="text-align:center;">154,792
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 21.7%
    </td>
    <td style="text-align:center;">293,723
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>24
    </td>
    <td><a href="/wiki/Kroger" title="Kroger">Kroger</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">148,258
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.5%
    </td>
    <td style="text-align:center;">430,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>25
    </td>
    <td><a class="mw-redirect" href="/wiki/Centene" title="Centene">Centene</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">144,547
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.7%
    </td>
    <td style="text-align:center;">74,300
    </td>
    <td><a href="/wiki/St._Louis" title="St. Louis">St. Louis, Missouri</a>
    </td></tr>
    <tr>
    <td>26
    </td>
    <td><a href="/wiki/Verizon_Communications" title="Verizon Communications">Verizon Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">136,835
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.4%
    </td>
    <td style="text-align:center;">117,100
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>27
    </td>
    <td><a href="/wiki/Walgreens_Boots_Alliance" title="Walgreens Boots Alliance">Walgreens Boots Alliance</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">132,703
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.7%
    </td>
    <td style="text-align:center;">262,500
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>28
    </td>
    <td><a href="/wiki/Fannie_Mae" title="Fannie Mae">Fannie Mae</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">121,596
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.7%
    </td>
    <td style="text-align:center;">8,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>29
    </td>
    <td><a href="/wiki/Comcast" title="Comcast">Comcast</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">121,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.3%
    </td>
    <td style="text-align:center;">186,000
    </td>
    <td><a href="/wiki/Philadelphia" title="Philadelphia">Philadelphia, Pennsylvania</a>
    </td></tr>
    <tr>
    <td>30
    </td>
    <td><a href="/wiki/AT%26T" title="AT&amp;T">AT&amp;T</a>
    </td>
    <td><a href="/wiki/Conglomerate_(company)" title="Conglomerate (company)">Conglomerate</a> and Telecomunications
    </td>
    <td style="text-align:center;">120,741
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 28.5%
    </td>
    <td style="text-align:center;">160,700
    </td>
    <td><a href="/wiki/Dallas" title="Dallas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>31
    </td>
    <td><a href="/wiki/Meta_Platforms" title="Meta Platforms">Meta Platforms</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">116,609
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.1%
    </td>
    <td style="text-align:center;">86,482
    </td>
    <td><a href="/wiki/Menlo_Park,_California" title="Menlo Park, California">Menlo Park, California</a>
    </td></tr>
    <tr>
    <td>32
    </td>
    <td><a href="/wiki/Bank_of_America" title="Bank of America">Bank of America</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">115,053
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.6%
    </td>
    <td style="text-align:center;">216,823
    </td>
    <td><a href="/wiki/Charlotte,_North_Carolina" title="Charlotte, North Carolina">Charlotte, North Carolina</a>
    </td></tr>
    <tr>
    <td>33
    </td>
    <td><a href="/wiki/Target_Corporation" title="Target Corporation">Target Corporation</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">109,120
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">440,000
    </td>
    <td><a href="/wiki/Minneapolis" title="Minneapolis">Minneapolis, Minnesota</a>
    </td></tr>
    <tr>
    <td>34
    </td>
    <td><a href="/wiki/Dell_Technologies" title="Dell Technologies">Dell Technologies</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">102,301
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 4.4%
    </td>
    <td style="text-align:center;">133,000
    </td>
    <td><a href="/wiki/Round_Rock,_Texas" title="Round Rock, Texas">Round Rock, Texas</a>
    </td></tr>
    <tr>
    <td>35
    </td>
    <td><a class="mw-redirect" href="/wiki/Archer_Daniels_Midland" title="Archer Daniels Midland">Archer Daniels Midland</a>
    </td>
    <td><a href="/wiki/Food_industry" title="Food industry">Food industry</a>
    </td>
    <td style="text-align:center;">101,556
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.1%
    </td>
    <td style="text-align:center;">41,181
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago,_Illinois" title="Chicago, Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>36
    </td>
    <td><a href="/wiki/Citigroup" title="Citigroup">Citigroup</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">101,078
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 26.6%
    </td>
    <td style="text-align:center;">238,104
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>37
    </td>
    <td><a href="/wiki/United_Parcel_Service" title="United Parcel Service">United Parcel Service</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Transportation" title="Transportation">Transportation</a>
    </td>
    <td style="text-align:center;">100,338
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.1%
    </td>
    <td style="text-align:center;">404,700
    </td>
    <td><a href="/wiki/Atlanta" title="Atlanta">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>38
    </td>
    <td><a href="/wiki/Pfizer" title="Pfizer">Pfizer</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">100,330
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 23.4%
    </td>
    <td style="text-align:center;">83,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>39
    </td>
    <td><a href="/wiki/Lowe%27s" title="Lowe's">Lowe's</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">97,059
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">244,500
    </td>
    <td><a href="/wiki/Mooresville,_North_Carolina" title="Mooresville, North Carolina">Mooresville, North Carolina</a>
    </td></tr>
    <tr>
    <td>40
    </td>
    <td><a href="/wiki/Johnson_%26_Johnson" title="Johnson &amp; Johnson">Johnson &amp; Johnson</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">94,943
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 1.2%
    </td>
    <td style="text-align:center;">152,700
    </td>
    <td><a href="/wiki/New_Brunswick,_New_Jersey" title="New Brunswick, New Jersey">New Brunswick, New Jersey</a>
    </td></tr>
    <tr>
    <td>41
    </td>
    <td><a href="/wiki/FedEx" title="FedEx">FedEx</a>
    </td>
    <td>Transportation
    </td>
    <td style="text-align:center;">93,512
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.4%
    </td>
    <td style="text-align:center;">518,249
    </td>
    <td><a href="/wiki/Memphis,_Tennessee" title="Memphis, Tennessee">Memphis, Tennessee</a>
    </td></tr>
    <tr>
    <td>42
    </td>
    <td><a href="/wiki/Humana" title="Humana">Humana</a>
    </td>
    <td>Health Insurance
    </td>
    <td style="text-align:center;">92,870
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 11.8%
    </td>
    <td style="text-align:center;">67,100
    </td>
    <td><a href="/wiki/Louisville,_Kentucky" title="Louisville, Kentucky">Louisville, Kentucky</a>
    </td></tr>
    <tr>
    <td>43
    </td>
    <td><a href="/wiki/Energy_Transfer_Partners" title="Energy Transfer Partners">Energy Transfer Partners</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">89,876
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.3%
    </td>
    <td style="text-align:center;">12,565
    </td>
    <td><a class="mw-redirect" href="/wiki/Dallas,_Texas" title="Dallas, Texas">Dallas, Texas</a>
    </td></tr>
    <tr>
    <td>44
    </td>
    <td><a href="/wiki/State_Farm" title="State Farm">State Farm</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">89,328
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">60,519
    </td>
    <td><a href="/wiki/Bloomington,_Illinois" title="Bloomington, Illinois">Bloomington, Illinois</a>
    </td></tr>
    <tr>
    <td>45
    </td>
    <td><a href="/wiki/Freddie_Mac" title="Freddie Mac">Freddie Mac</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">86,717
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.6%
    </td>
    <td style="text-align:center;">7,819
    </td>
    <td><a href="/wiki/McLean,_Virginia" title="McLean, Virginia">McLean, Virginia</a>
    </td></tr>
    <tr>
    <td>46
    </td>
    <td><a href="/wiki/PepsiCo" title="PepsiCo">PepsiCo</a>
    </td>
    <td><a href="/wiki/Drink" title="Drink">Beverage</a>
    </td>
    <td style="text-align:center;">86,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.7%
    </td>
    <td style="text-align:center;">315,000
    </td>
    <td><a href="/wiki/Purchase,_New_York" title="Purchase, New York">Purchase, New York</a>
    </td></tr>
    <tr>
    <td>47
    </td>
    <td><a href="/wiki/Wells_Fargo" title="Wells Fargo">Wells Fargo</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">82,859
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">238,000
    </td>
    <td><a href="/wiki/San_Francisco" title="San Francisco">San Francisco, California</a>
    </td></tr>
    <tr>
    <td>48
    </td>
    <td><a href="/wiki/The_Walt_Disney_Company" title="The Walt Disney Company">The Walt Disney Company</a>
    </td>
    <td>Media
    </td>
    <td style="text-align:center;">82,722
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 22.7%
    </td>
    <td style="text-align:center;">195,800
    </td>
    <td><a href="/wiki/Burbank,_California" title="Burbank, California">Burbank, California</a>
    </td></tr>
    <tr>
    <td>49
    </td>
    <td><a href="/wiki/ConocoPhillips" title="ConocoPhillips">ConocoPhillips</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">82,156
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 69.9%
    </td>
    <td style="text-align:center;">9,500
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>50
    </td>
    <td><a class="mw-redirect" href="/wiki/Tesla_Inc" title="Tesla Inc">Tesla</a>
    </td>
    <td>Automotive and Energy
    </td>
    <td style="text-align:center;">81,462
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 51.4%
    </td>
    <td style="text-align:center;">127,855
    </td>
    <td><a href="/wiki/Austin,_Texas" title="Austin, Texas">Austin, Texas</a>
    </td></tr>
    <tr>
    <td>51
    </td>
    <td><a href="/wiki/Procter_%26_Gamble" title="Procter &amp; Gamble">Procter &amp; Gamble</a>
    </td>
    <td>Consumer products Manufacturing
    </td>
    <td style="text-align:center;">80,187
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.3%
    </td>
    <td style="text-align:center;">106,000
    </td>
    <td><a href="/wiki/Cincinnati" title="Cincinnati">Cincinnati, Ohio</a>
    </td></tr>
    <tr>
    <td>52
    </td>
    <td><a href="/wiki/United_States_Postal_Service" title="United States Postal Service">United States Postal Service</a>
    </td>
    <td>Logistics
    </td>
    <td style="text-align:center;">78,620
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 2.0%
    </td>
    <td style="text-align:center;">576,000
    </td>
    <td><a href="/wiki/Washington,_D.C." title="Washington, D.C.">Washington, D.C.</a>
    </td></tr>
    <tr>
    <td>53
    </td>
    <td><a href="/wiki/Albertsons" title="Albertsons">Albertsons</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">77,650
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.0%
    </td>
    <td style="text-align:center;">198,650
    </td>
    <td><a href="/wiki/Boise,_Idaho" title="Boise, Idaho">Boise, Idaho</a>
    </td></tr>
    <tr>
    <td>54
    </td>
    <td><a href="/wiki/General_Electric" title="General Electric">General Electric</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">76,555
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000500000000000000♠" style="display:none"></span> 3.2%
    </td>
    <td style="text-align:center;">172,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>55
    </td>
    <td><a href="/wiki/MetLife" title="MetLife">MetLife</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">69,898
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.7%
    </td>
    <td style="text-align:center;">45,000
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>56
    </td>
    <td><a href="/wiki/Goldman_Sachs" title="Goldman Sachs">Goldman Sachs</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">68,711
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 5.7%
    </td>
    <td style="text-align:center;">48,500
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>57
    </td>
    <td><a href="/wiki/Sysco" title="Sysco">Sysco</a>
    </td>
    <td>Food Service
    </td>
    <td style="text-align:center;">68,636
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 33.8%
    </td>
    <td style="text-align:center;">70,510
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>58
    </td>
    <td><a class="mw-redirect" href="/wiki/Bunge_Limited" title="Bunge Limited">Bunge Limited</a>
    </td>
    <td>Food industry
    </td>
    <td style="text-align:center;">67,232
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.7%
    </td>
    <td style="text-align:center;">23,000
    </td>
    <td><a href="/wiki/White_Plains,_New_York" title="White Plains, New York">White Plains, New York</a>
    </td></tr>
    <tr>
    <td>59
    </td>
    <td><a href="/wiki/RTX_Corporation" title="RTX Corporation">RTX Corporation</a>
    </td>
    <td>Conglomerate
    </td>
    <td style="text-align:center;">67,074
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.2%
    </td>
    <td style="text-align:center;">182,000
    </td>
    <td><a href="/wiki/Arlington_County,_Virginia" title="Arlington County, Virginia">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>60
    </td>
    <td><a href="/wiki/Boeing" title="Boeing">Boeing</a>
    </td>
    <td><a href="/wiki/Aerospace_engineering" title="Aerospace engineering">Aerospace</a> and <a href="/wiki/Arms_industry" title="Arms industry">defense</a>
    </td>
    <td style="text-align:center;">66,608
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 6.9%
    </td>
    <td style="text-align:center;">156,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Arlington_County" title="Arlington County">Arlington County, Virginia</a>
    </td></tr>
    <tr>
    <td>61
    </td>
    <td><a class="mw-redirect" href="/wiki/StoneX_Group" title="StoneX Group">StoneX Group</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">66,036
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 55.3%
    </td>
    <td style="text-align:center;">305
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>62
    </td>
    <td><a href="/wiki/Lockheed_Martin" title="Lockheed Martin">Lockheed Martin</a>
    </td>
    <td>Aerospace and Defense
    </td>
    <td style="text-align:center;">65,984
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 1.6%
    </td>
    <td style="text-align:center;">116,000
    </td>
    <td><a href="/wiki/Bethesda,_Maryland" title="Bethesda, Maryland">Bethesda, Maryland</a>
    </td></tr>
    <tr>
    <td>63
    </td>
    <td><a href="/wiki/Morgan_Stanley" title="Morgan Stanley">Morgan Stanley</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">65,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 7.9%
    </td>
    <td style="text-align:center;">82,427
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>64
    </td>
    <td><a href="/wiki/Intel" title="Intel">Intel</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">63,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 20.1%
    </td>
    <td style="text-align:center;">131,900
    </td>
    <td><a href="/wiki/Santa_Clara,_California" title="Santa Clara, California">Santa Clara, California</a>
    </td></tr>
    <tr>
    <td>65
    </td>
    <td><a class="mw-redirect" href="/wiki/HP_Inc" title="HP Inc">HP</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">62,983
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.8%
    </td>
    <td style="text-align:center;">58,000
    </td>
    <td><a href="/wiki/Palo_Alto,_California" title="Palo Alto, California">Palo Alto, California</a>
    </td></tr>
    <tr>
    <td>66
    </td>
    <td><a href="/wiki/TD_Synnex" title="TD Synnex">TD Synnex</a>
    </td>
    <td><a class="mw-redirect" href="/wiki/Infotech" title="Infotech">Infotech</a>
    </td>
    <td style="text-align:center;">62,344
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 97.2%
    </td>
    <td style="text-align:center;">28,500
    </td>
    <td><a href="/wiki/Clearwater,_Florida" title="Clearwater, Florida">Clearwater, Florida</a>
    </td></tr>
    <tr>
    <td>67
    </td>
    <td><a href="/wiki/IBM" title="IBM">IBM</a>
    </td>
    <td>Technology and Cloud Computing
    </td>
    <td style="text-align:center;">60,530
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 16.3%
    </td>
    <td style="text-align:center;">303,100
    </td>
    <td><a href="/wiki/Armonk,_New_York" title="Armonk, New York">Armonk, New York</a>
    </td></tr>
    <tr>
    <td>68
    </td>
    <td><a href="/wiki/HCA_Healthcare" title="HCA Healthcare">HCA Healthcare</a>
    </td>
    <td>Healthcare
    </td>
    <td style="text-align:center;">60,233
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.5%
    </td>
    <td style="text-align:center;">250,500
    </td>
    <td><a href="/wiki/Nashville,_Tennessee" title="Nashville, Tennessee">Nashville, Tennessee</a>
    </td></tr>
    <tr>
    <td>69
    </td>
    <td><a href="/wiki/Prudential_Financial" title="Prudential Financial">Prudential Financial</a>
    </td>
    <td>Financials
    </td>
    <td style="text-align:center;">60,050
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 15.3%
    </td>
    <td style="text-align:center;">39,583
    </td>
    <td><a href="/wiki/Newark,_New_Jersey" title="Newark, New Jersey">Newark, New Jersey</a>
    </td></tr>
    <tr>
    <td>70
    </td>
    <td><a class="mw-redirect" href="/wiki/Caterpillar_Inc" title="Caterpillar Inc">Caterpillar</a>
    </td>
    <td>Machinery
    </td>
    <td style="text-align:center;">59,427
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 16.6%
    </td>
    <td style="text-align:center;">109,100
    </td>
    <td><a href="/wiki/Deerfield,_Illinois" title="Deerfield, Illinois">Deerfield, Illinois</a>
    </td></tr>
    <tr>
    <td>71
    </td>
    <td><a href="/wiki/Merck_%26_Co." title="Merck &amp; Co.">Merck &amp; Co.</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">59,283
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 15.8%
    </td>
    <td style="text-align:center;">68,000
    </td>
    <td><a href="/wiki/Kenilworth,_New_Jersey" title="Kenilworth, New Jersey">Kenilworth, New Jersey</a>
    </td></tr>
    <tr>
    <td>72
    </td>
    <td><a class="mw-redirect" href="/wiki/World_Fuel_Services" title="World Fuel Services">World Fuel Services</a>
    </td>
    <td>Petroleum industry and Logistics
    </td>
    <td style="text-align:center;">59,043
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 88.4%
    </td>
    <td style="text-align:center;">5,214
    </td>
    <td><a class="mw-redirect" href="/wiki/Miami,_Florida" title="Miami, Florida">Miami, Florida</a>
    </td></tr>
    <tr>
    <td>73
    </td>
    <td><a href="/wiki/New_York_Life_Insurance_Company" title="New York Life Insurance Company">New York Life Insurance Company</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">58,445
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.2%
    </td>
    <td style="text-align:center;">15,050
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>74
    </td>
    <td><a href="/wiki/Enterprise_Products" title="Enterprise Products">Enterprise Products</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">58,186
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 42.6%
    </td>
    <td style="text-align:center;">7,300
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>75
    </td>
    <td><a href="/wiki/AbbVie" title="AbbVie">AbbVie</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">58,054
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.3%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Lake_Bluff,_Illinois" title="Lake Bluff, Illinois">Lake Bluff, Illinois</a>
    </td></tr>
    <tr>
    <td>76
    </td>
    <td><a href="/wiki/Plains_All_American_Pipeline" title="Plains All American Pipeline">Plains All American Pipeline</a>
    </td>
    <td>Petroleum industry
    </td>
    <td style="text-align:center;">57,342
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 36.3%
    </td>
    <td style="text-align:center;">4,100
    </td>
    <td><a class="mw-redirect" href="/wiki/Houston,_Texas" title="Houston, Texas">Houston, Texas</a>
    </td></tr>
    <tr>
    <td>77
    </td>
    <td><a href="/wiki/Dow_Chemical_Company" title="Dow Chemical Company">Dow Chemical Company</a>
    </td>
    <td><a href="/wiki/Chemical_industry" title="Chemical industry">Chemical industry</a>
    </td>
    <td style="text-align:center;">56,902
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">37,800
    </td>
    <td><a href="/wiki/Midland,_Michigan" title="Midland, Michigan">Midland, Michigan</a>
    </td></tr>
    <tr>
    <td>78
    </td>
    <td><a class="mw-redirect" href="/wiki/AIG" title="AIG">AIG</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">56,437
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.4%
    </td>
    <td style="text-align:center;">26,200
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>79
    </td>
    <td><a href="/wiki/American_Express" title="American Express">American Express</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">55,625
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 27.3%
    </td>
    <td style="text-align:center;">77,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City, New York</a>
    </td></tr>
    <tr>
    <td>80
    </td>
    <td><a href="/wiki/Publix" title="Publix">Publix</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">54,942
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.5%
    </td>
    <td style="text-align:center;">242,000
    </td>
    <td><a href="/wiki/Lakeland,_Florida" title="Lakeland, Florida">Lakeland, Florida</a>
    </td></tr>
    <tr>
    <td>81
    </td>
    <td><a href="/wiki/Charter_Communications" title="Charter Communications">Charter Communications</a>
    </td>
    <td>Telecommunications
    </td>
    <td style="text-align:center;">54,022
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.5%
    </td>
    <td style="text-align:center;">101,700
    </td>
    <td><a href="/wiki/Stamford,_Connecticut" title="Stamford, Connecticut">Stamford, Connecticut</a>
    </td></tr>
    <tr>
    <td>82
    </td>
    <td><a href="/wiki/Tyson_Foods" title="Tyson Foods">Tyson Foods</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">53,282
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 13.2%
    </td>
    <td style="text-align:center;">142,000
    </td>
    <td><a href="/wiki/Springdale,_Arkansas" title="Springdale, Arkansas">Springdale, Arkansas</a>
    </td></tr>
    <tr>
    <td>83
    </td>
    <td><a href="/wiki/John_Deere" title="John Deere">John Deere</a>
    </td>
    <td>Agriculture manufacturing
    </td>
    <td style="text-align:center;">52,577
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 19.4%
    </td>
    <td style="text-align:center;">82,239
    </td>
    <td><a href="/wiki/Moline,_Illinois" title="Moline, Illinois">Moline, Illinois</a>
    </td></tr>
    <tr>
    <td>84
    </td>
    <td><a href="/wiki/Cisco" title="Cisco">Cisco</a>
    </td>
    <td>Telecom Hardware Manufacturing
    </td>
    <td style="text-align:center;">51,557
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.5%
    </td>
    <td style="text-align:center;">83,300
    </td>
    <td><a href="/wiki/San_Jose,_California" title="San Jose, California">San Jose, California</a>
    </td></tr>
    <tr>
    <td>85
    </td>
    <td><a href="/wiki/Nationwide_Mutual_Insurance_Company" title="Nationwide Mutual Insurance Company">Nationwide Mutual Insurance Company</a>
    </td>
    <td>Financial
    </td>
    <td style="text-align:center;">51,450
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 8.6%
    </td>
    <td style="text-align:center;">24,791
    </td>
    <td><a href="/wiki/Columbus,_Ohio" title="Columbus, Ohio">Columbus, Ohio</a>
    </td></tr>
    <tr>
    <td>86
    </td>
    <td><a href="/wiki/Allstate" title="Allstate">Allstate</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">51,412
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 3.4%
    </td>
    <td style="text-align:center;">54,250
    </td>
    <td><a href="/wiki/Northfield_Township,_Cook_County,_Illinois" title="Northfield Township, Cook County, Illinois">Northfield Township, Cook County, Illinois</a>
    </td></tr>
    <tr>
    <td>87
    </td>
    <td><a href="/wiki/Delta_Air_Lines" title="Delta Air Lines">Delta Air Lines</a>
    </td>
    <td><a href="/wiki/Airline" title="Airline">Airline</a>
    </td>
    <td style="text-align:center;">50,582
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000400000000000000♠" style="display:none"></span> 69.2%
    </td>
    <td style="text-align:center;">95,000
    </td>
    <td><a class="mw-redirect" href="/wiki/Atlanta_Georgia" title="Atlanta Georgia">Atlanta, Georgia</a>
    </td></tr>
    <tr>
    <td>88
    </td>
    <td><a href="/wiki/Liberty_Mutual" title="Liberty Mutual">Liberty Mutual</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,956
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 3.6%
    </td>
    <td style="text-align:center;">50,000
    </td>
    <td><a href="/wiki/Boston" title="Boston">Boston, Massachusetts</a>
    </td></tr>
    <tr>
    <td>89
    </td>
    <td><a class="mw-redirect" href="/wiki/TJX" title="TJX">TJX</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">49,936
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 2.9%
    </td>
    <td style="text-align:center;">329,000
    </td>
    <td><a href="/wiki/Framingham,_Massachusetts" title="Framingham, Massachusetts">Framingham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>90
    </td>
    <td><a href="/wiki/Progressive_Corporation" title="Progressive Corporation">Progressive Corporation</a>
    </td>
    <td>Insurance
    </td>
    <td style="text-align:center;">49,611
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span><span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.0%
    </td>
    <td style="text-align:center;">55,063
    </td>
    <td><a class="mw-redirect" href="/wiki/Mayfield_Village,_Ohio" title="Mayfield Village, Ohio">Mayfield Village, Ohio</a>
    </td></tr>
    <tr>
    <td>91
    </td>
    <td><a href="/wiki/American_Airlines" title="American Airlines">American Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">48,971
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 63.9%
    </td>
    <td style="text-align:center;">129,700
    </td>
    <td><a href="/wiki/Fort_Worth,_Texas" title="Fort Worth, Texas">Fort Worth, Texas</a>
    </td></tr>
    <tr>
    <td>92
    </td>
    <td><a class="mw-redirect" href="/wiki/CHS_Inc" title="CHS Inc">CHS</a>
    </td>
    <td>Agriculture cooperative
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 24.3%
    </td>
    <td style="text-align:center;">10,014
    </td>
    <td><a class="mw-redirect" href="/wiki/Inver_Grove_Heights" title="Inver Grove Heights">Inver Grove Heights, Minnesota</a>
    </td></tr>
    <tr>
    <td>93
    </td>
    <td><a href="/wiki/Performance_Food_Group" title="Performance Food Group">Performance Food Group</a>
    </td>
    <td>Food Processing
    </td>
    <td style="text-align:center;">47,194
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 61.6%
    </td>
    <td style="text-align:center;">34,825
    </td>
    <td><a href="/wiki/Richmond,_Virginia" title="Richmond, Virginia">Richmond, Virginia</a>
    </td></tr>
    <tr>
    <td>94
    </td>
    <td><a href="/wiki/PBF_Energy" title="PBF Energy">PBF Energy</a>
    </td>
    <td><a href="/wiki/Petroleum_industry" title="Petroleum industry">Petroleum industry</a>
    </td>
    <td style="text-align:center;">46,830
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 71.8%
    </td>
    <td style="text-align:center;">3,616
    </td>
    <td><a href="/wiki/Parsippany%E2%80%93Troy_Hills,_New_Jersey" title="Parsippany–Troy Hills, New Jersey">Parsippany–Troy Hills, New Jersey</a>
    </td></tr>
    <tr>
    <td>95
    </td>
    <td><a class="mw-redirect" href="/wiki/Nike_Inc" title="Nike Inc">Nike</a>
    </td>
    <td>Apparel
    </td>
    <td style="text-align:center;">46,710
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 4.9%
    </td>
    <td style="text-align:center;">79,100
    </td>
    <td><a href="/wiki/Beaverton,_Oregon" title="Beaverton, Oregon">Beaverton, Oregon</a>
    </td></tr>
    <tr>
    <td>96
    </td>
    <td><a href="/wiki/Best_Buy" title="Best Buy">Best Buy</a>
    </td>
    <td>Retail
    </td>
    <td style="text-align:center;">46,298
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 10.6%
    </td>
    <td style="text-align:center;">71,100
    </td>
    <td><a href="/wiki/Richfield,_Minnesota" title="Richfield, Minnesota">Richfield, Minnesota</a>
    </td></tr>
    <tr>
    <td>97
    </td>
    <td><a class="mw-redirect" href="/wiki/Bristol-Myers_Squibb" title="Bristol-Myers Squibb">Bristol-Myers Squibb</a>
    </td>
    <td>Pharmaceutical industry
    </td>
    <td style="text-align:center;">46,159
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Decrease"><img alt="Decrease" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/11px-Decrease2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/17px-Decrease2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Decrease2.svg/22px-Decrease2.svg.png 2x" width="11"/></span></span> <span data-sort-value="2999450000000000000♠" style="display:none"></span> 0.5%
    </td>
    <td style="text-align:center;">34,300
    </td>
    <td><a href="/wiki/New_York_City" title="New York City">New York City</a>, <a href="/wiki/New_York_(state)" title="New York (state)">New York</a>
    </td></tr>
    <tr>
    <td>98
    </td>
    <td><a href="/wiki/United_Airlines" title="United Airlines">United Airlines</a>
    </td>
    <td>Airline
    </td>
    <td style="text-align:center;">44,955
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 82.5%
    </td>
    <td style="text-align:center;">92,795
    </td>
    <td><a class="mw-redirect" href="/wiki/Chicago_Illinois" title="Chicago Illinois">Chicago, Illinois</a>
    </td></tr>
    <tr>
    <td>99
    </td>
    <td><a href="/wiki/Thermo_Fisher_Scientific" title="Thermo Fisher Scientific">Thermo Fisher Scientific</a>
    </td>
    <td>Laboratory instruments
    </td>
    <td style="text-align:center;">44,915
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 14.5%
    </td>
    <td style="text-align:center;">130,000
    </td>
    <td><a href="/wiki/Waltham,_Massachusetts" title="Waltham, Massachusetts">Waltham, Massachusetts</a>
    </td></tr>
    <tr>
    <td>100
    </td>
    <td><a href="/wiki/Qualcomm" title="Qualcomm">Qualcomm</a>
    </td>
    <td>Technology
    </td>
    <td style="text-align:center;">44,200
    </td>
    <td style="text-align:center;"><span typeof="mw:File"><span title="Increase"><img alt="Increase" class="mw-file-element" data-file-height="300" data-file-width="300" decoding="async" height="11" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/11px-Increase2.svg.png" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/17px-Increase2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Increase2.svg/22px-Increase2.svg.png 2x" width="11"/></span></span> <span data-sort-value="7000300000000000000♠" style="display:none"></span> 31.7%
    </td>
    <td style="text-align:center;">51,000
    </td>
    <td><a class="mw-redirect" href="/wiki/San_Diego,_Calif." title="San Diego, Calif.">San Diego, California</a>
    </td></tr></tbody></table>
    

### Pulling table headers


```python
world_titles = table.find_all('th')
```


```python
world_titles
```




    [<th>Rank
     </th>,
     <th>Name
     </th>,
     <th>Industry
     </th>,
     <th>Revenue <br/>(USD millions)
     </th>,
     <th>Revenue growth
     </th>,
     <th>Employees
     </th>,
     <th>Headquarters
     </th>]




```python
world_table_titles = [title.text.strip() for title in world_titles]

print(world_table_titles)
```

    ['Rank', 'Name', 'Industry', 'Revenue (USD millions)', 'Revenue growth', 'Employees', 'Headquarters']
    

### Importing pandas package and creating DataFrame to store scraped data


```python
import pandas as pd
```


```python
df = pd.DataFrame(columns = world_table_titles)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Rank</th>
      <th>Name</th>
      <th>Industry</th>
      <th>Revenue (USD millions)</th>
      <th>Revenue growth</th>
      <th>Employees</th>
      <th>Headquarters</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>



### Pulling row and individual data and populating the created DataFrame 'df'


```python
column_data = table.find_all('tr')
```


```python
for row in column_data[1:]:
    row_data = row.find_all('td')
    individual_row_data = [data.text.strip() for data in row_data]
    
    length = len(df)
    df.loc[length] = individual_row_data
```


```python
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Rank</th>
      <th>Name</th>
      <th>Industry</th>
      <th>Revenue (USD millions)</th>
      <th>Revenue growth</th>
      <th>Employees</th>
      <th>Headquarters</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Walmart</td>
      <td>Retail</td>
      <td>611,289</td>
      <td>6.7%</td>
      <td>2,100,000</td>
      <td>Bentonville, Arkansas</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Amazon</td>
      <td>Retail and cloud computing</td>
      <td>513,983</td>
      <td>9.4%</td>
      <td>1,540,000</td>
      <td>Seattle, Washington</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>ExxonMobil</td>
      <td>Petroleum industry</td>
      <td>413,680</td>
      <td>44.8%</td>
      <td>62,000</td>
      <td>Spring, Texas</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Apple</td>
      <td>Electronics industry</td>
      <td>394,328</td>
      <td>7.8%</td>
      <td>164,000</td>
      <td>Cupertino, California</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>UnitedHealth Group</td>
      <td>Healthcare</td>
      <td>324,162</td>
      <td>12.7%</td>
      <td>400,000</td>
      <td>Minnetonka, Minnesota</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>95</th>
      <td>96</td>
      <td>Best Buy</td>
      <td>Retail</td>
      <td>46,298</td>
      <td>10.6%</td>
      <td>71,100</td>
      <td>Richfield, Minnesota</td>
    </tr>
    <tr>
      <th>96</th>
      <td>97</td>
      <td>Bristol-Myers Squibb</td>
      <td>Pharmaceutical industry</td>
      <td>46,159</td>
      <td>0.5%</td>
      <td>34,300</td>
      <td>New York City, New York</td>
    </tr>
    <tr>
      <th>97</th>
      <td>98</td>
      <td>United Airlines</td>
      <td>Airline</td>
      <td>44,955</td>
      <td>82.5%</td>
      <td>92,795</td>
      <td>Chicago, Illinois</td>
    </tr>
    <tr>
      <th>98</th>
      <td>99</td>
      <td>Thermo Fisher Scientific</td>
      <td>Laboratory instruments</td>
      <td>44,915</td>
      <td>14.5%</td>
      <td>130,000</td>
      <td>Waltham, Massachusetts</td>
    </tr>
    <tr>
      <th>99</th>
      <td>100</td>
      <td>Qualcomm</td>
      <td>Technology</td>
      <td>44,200</td>
      <td>31.7%</td>
      <td>51,000</td>
      <td>San Diego, California</td>
    </tr>
  </tbody>
</table>
<p>100 rows × 7 columns</p>
</div>



### Exporting table as 'csv' file


```python
df.to_csv(r'C:\Users\use\Documents\Python Project Docs/Companies.csv', index = False)
```

### END
