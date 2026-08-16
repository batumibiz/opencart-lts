# Changelog 

All notable changes to this project will be documented in this file.    
Detailed changes can see in the [repository log](https://github.com/batumibiz/opencart-lts/commits/main/).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0).

## Note regarding sources
- Entries accompanied by a reference link indicate code borrowed or adapted from external sources.  
- Entries without a reference link were developed exclusively within this repositor.


## [Unreleased]

#### Added
- `admin` Improved filter JS: added highlighting of active filters
- `admin` Filter with autocomplete for product attributes
- `admin` Filter with autocomplete for downloads
- `admin` Filter with autocomplete for options
- `admin` Autocomplete for Rewiews / Author
- `admin` Autocomplete for Marketing / Marketing

#### Changed
- `system` Fonts Awesome updated to version 7.3.1
- `admin` Deep refactoring of filter functionality
- `admin` Improved online report
- `admin` Changed style of disabled list items

#### Deprecated
- Nothing

#### Removed
- `admin` Removed a large amount of legacy and duplicate code.

#### Fixed
- `system` Various static analyzer warnings
- `admin` Product model filter autocomplete

#### Security
- Nothing


## [1.0.0] 2026-07-27

### Added
- `system` Emulation of `GLOB_BRACE`: introduced a custom `oc_glob()` helper function.
- `system` CSS minification, minified versions of CSS are used.
- `admin` [#14857](https://github.com/opencart/opencart/pull/14857) - Manufacturer filter.
- `admin` Language Editor filter.
- `admin` Remember the last directory in the file manager.
- `admin` The `date_added` field has been added to the product form.
- `admin` Modern `Chart.js` library for Dashboard sales and analytics visualization.
- `admin` Lightweight library `Jsvectormap` for Dashboard map visualization.
- `admin` Highlighting active filter buttons.
- `admin` Top pagination.
- `admin` Autocomplete for `Countries` filters.
- `admin` Autocomplete for `Zone` filters.
- `admin` Autocomplete for `SEO URL` filters.
- `admin` Autocomplete for online report `IP` filter.
- `catalog` [#15479](https://github.com/opencart/opencart/pull/15479) - Support multi-word product name search.
- `catalog` Button to change an order on the checkout page.

### Changed
- `system` [#14753](https://github.com/opencart/opencart/pull/14753) - Retrieve more in depth files from extension directory for permission.
- `system` [#14818](https://github.com/opencart/opencart/pull/14818) - Safest one just in case the product options are empty.
- `system` [#14891](https://github.com/opencart/opencart/pull/14891) - To collect cache files, do it only if the random has fallen to the cleanup.
- `system` [#14915](https://github.com/opencart/opencart/pull/14915) - Add `OPTIMIZE TABLE` to `db.php`.
- `system` [#15326](https://github.com/opencart/opencart/pull/15326) - Use the composer-generated autoload for the 3rd-party packages.
- `system` [#15569](https://github.com/opencart/opencart/pull/15569) - Adjust cache-control headers.
- `system` [#15513](https://github.com/opencart/opencart/pull/15513) - Change product rating field type to float.
- `system` Refactored to replace all `glob()` calls using the `GLOB_BRACE` flag with `oc_glob()`.
- `system` `scssphp/scssphp` package updated to version `2.1`.
- `system` `twig/twig` package updated to version `3.28`.
- `system` Bootstrap CSS and JS updated to version `5.3.8`.
- `system` jQuery updated to version `4.0.0`.
- `system` Monolithic `stylesheet.css` has been converted to a modular SCSS structure.
- `system` `common.js` fixed and improved _(revision using Claude LLM)_.
- `system` `Library::addScript()` - The list of scripts can be passed as an array.
- `system` Improved session handler.
- `system` Improved cache cleanup.
- `system` Improved .css refresh.
- `admin` [0a8b25a](https://github.com/opencart/opencart/commit/0a8b25aaedae97e1b21784263527941448724693) - Added some additional form text.
- `admin` [8996eb3](https://github.com/opencart/opencart/commit/8996eb371620c3c7a453872d39a3a815562690f3) - `partially used` - Improved `admin/controller/marketplace/installer.php`.
- `admin` [#14820](https://github.com/opencart/opencart/pull/14820) - Event list: always allow for viewing event details.
- `admin` Reduced the size of the "Delete" buttons on the 'Links' tab of the product form.
- `admin` Reworked Filters for the Admin panel:
	- Improved HTML code.
	- Used a completely new JS function that can be reused.
	- Removed a large amount of duplicate and outdated code.
- `admin` Reworked Autocomplete for the Admin panel:
	- Used a completely new JS function that can be reused.
	- Removed a large amount of duplicate and outdated code.
- `admin` SEO tab merged with General tab.
- `admin` Improved table header style.
- `admin` Improved mobile viewing.
- `admin` Language Editor - added check for duplicated key.
- `catalog` [#14790](https://github.com/opencart/opencart/pull/14790) - Updated `catalog/language/en-gb/default.php`, added `text_all`.

### Removed
- `system` Removed a large amount of legacy and duplicate code.
- `system` Legacy `cron.php`.
- `system` Deprecated libraries (replaced with current versions):
	- `Flot` (replaced with `Chart.js`).
	- `jQuery Vector Map` (replaced with `Jsvectormap`).
- `system` Deprecated PHP functions:
	- `imagedestroy`.
	- `curl_close`.
- `system` As unused:
	- Legacy vendor-related functionality.
	- `upload/system/helper/filter.php`.
	- `aws/aws-sdk-php` package.
	- `bootstrap-icons`.
	- `nunjucks-slim.js` library.
	- `jquery-ui`.

### Fixed
- `system` [#14764](https://github.com/opencart/opencart/issues/14764) - Admin login as customer not working.
- `system` [#14867](https://github.com/opencart/opencart/pull/14867) - Fix autoloader: one namespace can contain classes from different folders.
- `system` [#14895](https://github.com/opencart/opencart/issues/14895) - Should use array_merge.
- `system` [#15046](https://github.com/opencart/opencart/pull/15046), [6999e3e](https://github.com/opencart/opencart/commit/6999e3e6c091aafa958eefa2af1a2deff10524a3#diff-6ec7893dd58bb90a8bb72684d687095fb309087e63063d59d90b64e53f6ed3ec), [6dd838b](https://github.com/opencart/opencart/commit/6dd838bf7b469e7da80df22dd0439d25037a412f) - Various bugs in `system/library/curl.php`.
- `system` [#15333](https://github.com/opencart/opencart/pull/15333), [#15397](https://github.com/opencart/opencart/pull/15397) - A set of fixes from @plemondev (partially used).
- `system` [#15354](https://github.com/opencart/opencart/pull/15354) - Fixed the OCMOD functionality.
- `system` [#15367](https://github.com/opencart/opencart/pull/15367) - Added fixes for integrating various caching engines.
- `system` [#15409](https://github.com/opencart/opencart/pull/15409) - A set of improvements and fixes from @plemondev (partially used).
- `system` [#15447](https://github.com/opencart/opencart/pull/15447) - Fix install open_basedir validation.
- `system` [#15554](https://github.com/opencart/opencart/pull/15554) - Fix email validation logic.
- `system` [#15605](https://github.com/opencart/opencart/pull/15605), [#15606](https://github.com/opencart/opencart/pull/15606) Match api routes case insensitively in the startup gate.
- `system` Fix viewing embedded Youtube video.
- `system` When unloading extensions, archives with errors were not deleted, but remained in the `/marketplace` folder.
- `system` The password recovery link in the email was visible as plain text.
- `system` Error: Invalid session ID.
- `system` Variable `$file` in `isset()` always exists and is not nullable in `system/engine/autoloader.php` (90).
- `system` PHP Warning: unlink(): No such file or directory in /system/library/cache/file.php on line 37.
- `system` **Green Build** - Fixed various static analysis errors and comments.
- `system` Various minor fixes...
- `admin` [#14438](https://github.com/opencart/opencart/issues/14438) - WYSIWYG misconfiguration in ADMIN page for product edit.
- `admin` [#14498](https://github.com/opencart/opencart/issues/14498) - Sales order Store - wrong in the order list.
- `admin` [#14731](https://github.com/opencart/opencart/issues/14731) - In additional Stores Cookie Policy is not selectable.
- `admin` [#14736](https://github.com/opencart/opencart/pull/14736) - Fix disabled products design same as other table lists.
- `admin` [#14739](https://github.com/opencart/opencart/issues/14739) - After creating multiple folders, the root directory images are not displayed.
- `admin` [#14740](https://github.com/opencart/opencart/pull/14740) - Renamed total function as they had an incorrect name.
- `admin` [#14756](https://github.com/opencart/opencart/pull/14756) - Order files are not displaying in the admin order details page.
- `admin` [#14758](https://github.com/opencart/opencart/issues/14758) - Unnecessary parameter.
- `admin` [#14791](https://github.com/opencart/opencart/pull/14791) - Fix wrong search result pagination.
- `admin` [#14822](https://github.com/opencart/opencart/pull/14822) - In Admin, while creating new order, Product is not being added.
- `admin` [#14878](https://github.com/opencart/opencart/issues/14878) - Wrong column used in topic layout methods (`article_id` instead of `topic_id`).
- `admin` [#15363](https://github.com/opencart/opencart/pull/15363) - Fixed Category Filter.
- `admin` [#15381](https://github.com/opencart/opencart/pull/15381) - Fix category filter model.
- `admin` [#15418](https://github.com/opencart/opencart/pull/15418) - Keep variant's code override on master update.
- `admin` [#15420](https://github.com/opencart/opencart/pull/15420) - Fix admin product list wrong discount value.
- `admin` [#15436](https://github.com/opencart/opencart/pull/15436) - Keep order's status on admin update.
- `admin` [#15437](https://github.com/opencart/opencart/issues/15437), [#15516](https://github.com/opencart/opencart/pull/15516), [#15519](https://github.com/opencart/opencart/pull/15519) - Order edit/add fixes.
- `admin` [#15467](https://github.com/opencart/opencart/pull/15467) - Fix promotions request.
- `admin` [#15473](https://github.com/opencart/opencart/pull/15473) - Fix escaping in backup.
- `admin` [#15476](https://github.com/opencart/opencart/pull/15476) - Fix admin edit order not saving language and currency.
- `admin` [#15556](https://github.com/opencart/opencart/pull/15556) - Product Option Value Weight Display Bug.
- `admin` The zone name was not displayed in the list.
- `admin` Error: Product::getDiscounts(): Argument #1 ($product_id) must be of type int.
- `admin` Administrator password recovery.
- `admin` Display of sales statistics on the Dashboard Map.
- `admin` SQL error on `admin/sale/subscription` filter.
- `admin` SQL error on `admin/sale/returns` filter.
- `admin` Fixed `Design -> Layouts` form.
- `admin` Fixed reports HTML markup errors.
- `admin` Fixed filemanager pagination count.
- `catalog` [#14744](https://github.com/opencart/opencart/issues/14744) - BUG in product settlement.
- `catalog` [#14746](https://github.com/opencart/opencart/issues/14746) - Various bugs with `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`.
- `catalog` [#14755](https://github.com/opencart/opencart/issues/14755) - Wrong total on cart page.
- `catalog` [#14803](https://github.com/opencart/opencart/issues/14803) - Admin order notes are visible to the customer.
- `catalog` [#14843](https://github.com/opencart/opencart/pull/14843) - Fix autoloader in storeInstance to ensure proper class loading.
- `catalog` [#14845](https://github.com/opencart/opencart/issues/14845) - Missing language definition in `account/forgotten.php`.
- `catalog` [#14882](https://github.com/opencart/opencart/issues/14882) - Undefined array key "payment_zones".
- `catalog` [#14887](https://github.com/opencart/opencart/issues/14887) - `Product::addReport()`: Argument #1 must be of type `int`, `string` given.
- `catalog` [#14903](https://github.com/opencart/opencart/pull/14903) - Fixed `getTotals()`.
- `catalog` [#14988](https://github.com/opencart/opencart/pull/14988) - Correct method names for bulk delete operations.
- `catalog` [#forum](https://forum.opencart.com/viewtopic.php?t=235946#p880856) - Error when deleting a product from Wishlist.
- `catalog` [#15396](https://github.com/opencart/opencart/pull/15396) - Voiding the order here should only happen if it has already been confirmed.
- `catalog` [#15404](https://github.com/opencart/opencart/pull/15404) - Catalog and Extensions Fixed.
- `catalog` [#15412](https://github.com/opencart/opencart/pull/15412) - Missing user's name in activity on checkout register.
- `catalog` [#15415](https://github.com/opencart/opencart/pull/15415) - Add variant to cart adding master instead.
- `catalog` [#15428](https://github.com/opencart/opencart/pull/15428) - Multiple issues in checkout's register component.
- `catalog` [#15463](https://github.com/opencart/opencart/pull/15463) - Fix related products showing for wrong store.
- `catalog` [7d891b4](https://github.com/opencart/opencart/commit/7d891b44a87faeacdb479352dfda9d2c3aff2bbb) - Fixes in Account.
- `catalog` Undefined array key "author" in catalog/controller/product/review.php on line 161.
- `catalog` getProduct(): Argument #1 ($product_id) must be of type int.
- `catalog` PHP Warning:  Undefined array key "en-gb'nvOpzp;..." in catalog/controller/common/language.php.
- `catalog` Undefined variable `$price_status` in `catalog/controller/api/cart.php`.
- `catalog` Undefined variable `$thid` in `catalog/controller/api/order.php`.
- `catalog` getReviewsByProductId(): Argument 2 ($start) must be of type int (mentioned on [#15319](https://github.com/opencart/opencart/issues/15319)).

### Security
- `admin` [#15445](https://github.com/opencart/opencart/pull/15445) - Prevent XSS in error log view.


## Soure Code
Based on [OpenCart 4.1.0.3](https://github.com/opencart/opencart/releases/tag/4.1.0.3) as the foundation for all subsequent development within this branch.


[Unreleased]: https://github.com/oc-plus/oc-plus/compare/1.0.0...HEAD
[1.0.0]: https://github.com/oc-plus/oc-plus/releases/tag/1.0.0
