function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (var i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }

    return '';
}

$(document).ready(function() {
    // Tooltip
    var oc_tooltip = function() {
        // Get tooltip instance
        var tooltip = bootstrap.Tooltip.getOrCreateInstance(this);

        if (tooltip) {
            // Apply to current element
            tooltip.show();
        }
    }

    $(document).on('mouseenter', '[data-bs-toggle=\'tooltip\']', oc_tooltip);

    $(document).on('click', 'button', function() {
        $('.tooltip').remove();
    });

    $(document).on('click', '[data-bs-toggle=\'pagination\'] a', function(e) {
        e.preventDefault();

        var element = this;

        //[data-bs-target='pagination']

        var target = $(element).attr('data-bs-target');

        if (target) {
            $(target).load(this.href);
        }
    });

    // Alert Fade
    $('#alert').observe(function() {
        window.setTimeout(function() {
            $('#alert .alert-dismissible').fadeTo(3000, 0, function() {
                $(this).remove();
            });
        }, 3000);
    });

    // Button
    +function($) {
        $.fn.button = function(state) {
            return this.each(function() {
                var element = this;

                if (state == 'loading') {
                    element._oc_html = $(element).html();
                    element._oc_state = $(element).prop('disabled');

                    $(element).prop('disabled', true).width($(element).width()).html('<i class="fa-solid fa-circle-notch fa-spin text-light"></i>');
                }

                if (state == 'reset') {
                    $(element).prop('disabled', element._oc_state).width('').html(element._oc_html);
                }
            });
        }
    }(jQuery);
});

function decodeHTMLEntities(html) {
    var d = document.createElement('div');

    d.innerHTML = html;

    return d.textContent;
}

// Observe
+function($) {
    $.fn.observe = function(callback) {
        var observer = new MutationObserver(callback);

        observer.observe($(this)[0], {
            characterData: false,
            childList: true,
            attributes: false
        });
    };
}(jQuery);

// Chain ajax calls.
class Chain {
    constructor() {
        this.start = false;
        this.data = [];
    }

    attach(call) {
        this.data.push(call);

        if (!this.start) {
            this.execute();
        }
    }

    execute() {
        if (this.data.length) {
            this.start = true;

            var call = this.data.shift();

            var jqxhr = call();

            var self = this;

            jqxhr.done(function() {
                self.execute();
            });
        } else {
            this.start = false;
        }
    }
}

var chain = new Chain();

// Forms
$(document).on('submit', 'form', function(e) {
    var element = this;
    var button = (e.originalEvent !== undefined && e.originalEvent.submitter !== undefined) ? e.originalEvent.submitter : '';

    if ($(element).attr('data-oc-toggle') == 'ajax' || $(button).attr('data-oc-toggle') == 'ajax') {
        e.preventDefault();

        var form = e.target;
        var action = $(button).attr('formaction') || $(form).attr('action');
        var method = $(button).attr('formmethod') || $(form).attr('method') || 'post';
        var enctype = $(button).attr('formenctype') || $(form).attr('enctype') || 'application/x-www-form-urlencoded';

        // https://github.com/opencart/opencart/issues/9690
        if (typeof CKEDITOR != 'undefined') {
            for (var instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
        }

        $.ajax({
            url: action.replaceAll('&amp;', '&'),
            type: method,
            data: $(form).serialize(),
            dataType: 'json',
            contentType: enctype,
            beforeSend: function() {
                $(button).button('loading');
            },
            complete: function() {
                $(button).button('reset');
            },
            success: function(json, textStatus) {
                $('.alert-dismissible').remove();
                $(element).find('.is-invalid').removeClass('is-invalid');
                $(element).find('.invalid-feedback').removeClass('d-block');

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (typeof json['error'] == 'string') {
                    $('#alert').prepend('<div class="alert alert-danger alert-dismissible"><i class="fa-solid fa-circle-exclamation"></i> ' + json['error'] + ' <button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>');
                }

                if (typeof json['error'] == 'object') {
                    if (json['error']['warning']) {
                        $('#alert').prepend('<div class="alert alert-danger alert-dismissible"><i class="fa-solid fa-circle-exclamation"></i> ' + json['error']['warning'] + ' <button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>');
                    }

                    for (var key in json['error']) {
                        $('#input-' + key.replaceAll('_', '-')).addClass('is-invalid').find('.form-control, .form-select, .form-check-input, .form-check-label').addClass('is-invalid');
                        $('#error-' + key.replaceAll('_', '-')).html(json['error'][key]).addClass('d-block');
                    }
                }

                if (json['success']) {
                    $('#alert').prepend('<div class="alert alert-success alert-dismissible"><i class="fa-solid fa-circle-check"></i> ' + json['success'] + ' <button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>');

                    // Refresh
                    var url = $(form).attr('data-oc-load');
                    var target = $(form).attr('data-oc-target');

                    if (url !== undefined && target !== undefined) {
                        $(target).load(url);
                    }
                }

                // Replace any form values that correspond to form names.
                for (var key in json) {
                    $(element).find('[name=\'' + key + '\']').val(json[key]);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
});

// Upload
$(document).on('click', '[data-oc-toggle=\'upload\']', function() {
    var element = this;

    if (!$(element).prop('disabled')) {
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" value=""/></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        $('#form-upload input[name=\'file\']').on('change', function(e) {
            if ((this.files[0].size / 1024) > $(element).attr('data-oc-size-max')) {
                alert($(element).attr('data-oc-size-error'));

                $(this).val('');
            }
        });

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        var timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: $(element).attr('data-oc-url'),
                    type: 'post',
                    data: new FormData($('#form-upload')[0]),
                    dataType: 'json',
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(element).button('loading');
                    },
                    complete: function() {
                        $(element).button('reset');
                    },
                    success: function(json) {
                        if (json['error']) {
                            alert(json['error']);
                        }

                        if (json['success']) {
                            alert(json['success']);
                        }

                        if (json['code']) {
                            $($(element).attr('data-oc-target')).val(json['code']);

                            $(element).parent().find('[data-oc-toggle=\'download\'], [data-oc-toggle=\'clear\']').prop('disabled', false);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    }
});

$(document).on('click', '[data-oc-toggle=\'download\']', function(e) {
    var element = this;

    var value = $($(element).attr('data-oc-target')).val();

    if (value != '') {
        location = 'index.php?route=tool/upload.download&user_token=' + getURLVar('user_token') + '&code=' + value;
    }
});

$(document).on('click', '[data-oc-toggle=\'clear\']', function() {
    var element = this;

    // Images
    var thumb = $(this).attr('data-oc-thumb');

    if (thumb !== undefined) {
        $(thumb).attr('src', $(thumb).attr('data-oc-placeholder'));
    }

    // Custom fields
    var download = $(element).parent().find('[data-oc-toggle=\'download\']');

    if (download.length) {
        $(element).parent().find('[data-oc-toggle=\'download\'], [data-oc-toggle=\'clear\']').prop('disabled', true);
    }

    $($(this).attr('data-oc-target')).val('');
});

// Image Manager
$(document).on('click', '[data-oc-toggle=\'image\']', function(e) {
    var element = this;

    $('#modal-image').remove();

    $.ajax({
        url: 'index.php?route=common/filemanager&user_token=' + getURLVar('user_token') + '&target=' + encodeURIComponent($(element).attr('data-oc-target')) + '&thumb=' + encodeURIComponent($(element).attr('data-oc-thumb')),
        dataType: 'html',
        beforeSend: function() {
            $(element).button('loading');
        },
        complete: function() {
            $(element).button('reset');
        },
        success: function(html) {
            $('body').append(html);

            $('#modal-image').modal('show');
        }
    });
});

// Autocomplete
+function($) {
    $.fn.autocomplete = function(option) {
        return this.each(function() {
            var element = this;
            var $dropdown = $('#' + $(element).attr('data-oc-target'));

            this.timer = null;
            this.items = [];

            $.extend(this, option);

            // Focus in
            $(element).on('focusin', function() {
                element.request();
            });

            // Focus out
            $(element).on('focusout', function(e) {
                if (!e.relatedTarget || !$(e.relatedTarget).hasClass('dropdown-item')) {
                    this.timer = setTimeout(function(object) {
                        object.removeClass('show');
                    }, 50, $dropdown);
                }
            });

            // Input
            $(element).on('input', function(e) {
                element.request();
            });

            // Click
            $dropdown.on('click', 'a', function(e) {
                e.preventDefault();

                var value = $(this).attr('href');

                if (element.items[value] !== undefined) {
                    element.select(element.items[value]);

                    $dropdown.removeClass('show');
                }
            });

            // Request
            this.request = function() {
                clearTimeout(this.timer);

                $('#autocomplete-loading').remove();
                $dropdown.find('li').remove();

                $dropdown.prepend('<li id="autocomplete-loading"><span class="dropdown-item text-center disabled"><i class="fa-solid fa-circle-notch fa-spin"></i></span></li>');
                $dropdown.addClass('show');

                this.timer = setTimeout(function(object) {
                    object.source($(object).val(), $.proxy(object.response, object));
                }, 150, this);
            }

            // Response
            this.response = function(json) {
                var html = '';
                var category = {};
                var name;
                var i = 0, j = 0;

                if (json.length) {
                    for (i = 0; i < json.length; i++) {
                        // update element items
                        this.items[json[i]['value']] = json[i];

                        if (!json[i]['category']) {
                            // ungrouped items
                            html += '<li><a href="' + json[i]['value'] + '" class="dropdown-item">' + json[i]['label'] + '</a></li>';
                        } else {
                            // grouped items
                            name = json[i]['category'];

                            if (!category[name]) {
                                category[name] = [];
                            }

                            category[name].push(json[i]);
                        }
                    }

                    for (name in category) {
                        html += '<li><h6 class="dropdown-header">' + name + '</h6></li>';

                        for (j = 0; j < category[name].length; j++) {
                            html += '<li><a href="' + category[name][j]['value'] + '" class="dropdown-item">' + category[name][j]['label'] + '</a></li>';
                        }
                    }

                    $dropdown.html(html);
                } else {
                    $dropdown.removeClass('show');
                }
            }
        });
    }
}(jQuery);

$(document).ready(function() {
    // Header
    $('#header-notification [data-bs-toggle=\'modal\']').on('click', function(e) {
        e.preventDefault();

        var element = this;

        $('#modal-notification').remove();

        $.ajax({
            url: $(element).attr('href'),
            dataType: 'html',
            success: function(html) {
                $('body').append(html);

                $('#modal-notification').modal('show');
            }
        });
    });

    // Menu
    $('#button-menu').on('click', function(e) {
        e.preventDefault();

        $('#column-left').toggleClass('active');
    });

    // Set last page opened on the menu
    $('#menu a[href]').on('click', function() {
        sessionStorage.setItem('menu', $(this).attr('href'));
    });

    if (!sessionStorage.getItem('menu')) {
        $('#menu #menu-dashboard').addClass('active');
    } else {
        // Sets active and open to selected page in the left column menu.
        $('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parent().addClass('active');
    }

    $('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').children('a').removeClass('collapsed');

    $('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('ul').addClass('show');

    $('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').addClass('active');

    $('#nav-language .dropdown-item').on('click', function(e) {
        e.preventDefault();

        var element = this;

        $.ajax({
            url: 'index.php?route=common/language.save&user_token={{ user_token }}',
            type: 'post',
            data: 'code=' + $(element).attr('href') + '&redirect=' + encodeURIComponent($('#input-redirect').val()),
            dataType: 'json',
            success: function(json) {
                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['error']) {
                    $('#alert').prepend('<div class="alert alert-danger alert-dismissible"><i class="fa-solid fa-circle-exclamation"></i> ' + json['error'] + ' <button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
});

/**
 * Universal Filter Handler
 *
 * Usage:
 *
 * ocFilter(options)
 *
 * Required options:
 *   route     {string}  Controller route                 (e.g. 'catalog/category')
 *   userToken {string}  user_token for current session   (e.g. '{{ user_token }}')
 * Optional
 *   formId    {string}  jQuery filter form selector      (e.g. '#form-filter', default '#form-filter')
 *   listId    {string}  jQuery list container selector   (e.g. '#list', default '#list')
 *
 * Example:
 *
 * ocFilter({
 *   formId    : '#form-filter',
 *   listId    : '#category',
 *   route     : 'catalog/category',
 *   userToken : '{{ user_token }}',
 * });
 */

function ocFilter(options) {
	const $form = $(options.formId ?? '#form-filter');
	const $list = $(options.listId ?? '#list');
	const routePart = 'index.php?route=' + options.route;
	const tokenPart = '&user_token=' + options.userToken;

	const $submit = $form.find('button[type="submit"]');
	const $reset = $form.find('button[type="reset"]');

	function hasNonEmptyFields() {
		let filterNotEmpty = false;

		$form.find('input[name], select[name]').each(function () {
			const value = $(this).val();

			if (value !== '' && value !== null) {
				filterNotEmpty = true;
			}
		});

		return filterNotEmpty;
	}

	function highlightActive() {
		$submit.removeClass('btn-outline-primary').addClass('btn-primary');
		$reset.removeClass('btn-outline-secondary').addClass('btn-secondary');
	}

	// Highlight on page load if form already has non-empty values
	if (hasNonEmptyFields()) {
		highlightActive();
	}

	$form.on('submit', function (e) {
		e.preventDefault();

		// We use only non-empty fields
		const filterData = {};

		$(this).find('input[name], select[name]').each(function () {
			const value = $(this).val();

			if (value !== '' && value !== null) {
				filterData[$(this).attr('name')] = value;
			}
		});

		if (hasNonEmptyFields()) {
			const urlParams = $.param(filterData);
			const query = urlParams ? '&' + urlParams : '';

			window.history.pushState({}, null, routePart + query + tokenPart);
			$list.load(routePart + '.list' + query + tokenPart);

			highlightActive();
		}
	});

	$form.on('reset', function () {
		$submit.removeClass('btn-primary').addClass('btn-outline-primary');
		$reset.removeClass('btn-secondary').addClass('btn-outline-secondary');

		window.location = routePart + tokenPart;
	});
}

/**
 * Universal Autocomplete Helper
 *
 * Usage:
 *
 * ocAutocomplete(options)
 *
 * Required options:
 *   inputSelector  {string}   jQuery text field selector
 *   route          {string}   Autocomplete route (e.g. 'catalog/category.autocomplete')
 *   userToken      {string}   user_token for current session
 *   valueKey       {string}   The "value" key in the JSON response (e.g. 'category_id')
 *   labelKey       {string}   "label" key in JSON response (e.g. 'name')
 *   onSelect       {function(item)}  Called when an item is selected.
 *                              item = { value, label }
 *
 * Optional options:
 *   prependNone    {boolean|string}
 *                  false  — do not add an empty item (default)
 *                  true   — add { value: '0', label: '' }
 *                  string — add { value: '0', label: <this string> }
 *
 * Example — field with parent category (with the item "None"):
 *
 * ocAutocomplete({
 *     inputSelector : '#input-parent',
 *     route         : 'catalog/category.autocomplete',
 *     userToken     : '{{ user_token }}',
 *     valueKey      : 'category_id',
 *     labelKey      : 'name',
 *     prependNone   : '{{ text_none }}',
 *     onSelect      : function(item) {
 *       $('#input-parent').val(decodeHTMLEntities(item.label));
 *       $('#input-parent-id').val(item.value);
 *     }
 *   });
 *
 * Example — filter field (without prependNone, adds a row to the table):
 *
 * ocAutocomplete({
 *     inputSelector : '#input-filter',
 *     route         : 'catalog/filter.autocomplete',
 *     userToken     : '{{ user_token }}',
 *     valueKey      : 'filter_id',
 *     labelKey      : 'name',
 *     onSelect      : function(item) {
 *       $('#input-filter').val('');
 *       $('#row-filter-' + item.value).remove();
 *       var html  = '<tr id="row-filter-' + item.value + '">';
 *           html += '  <td>' + item.label + '<input type="hidden" name="category_filter[]" value="' + item.value + '"/></td>';
 *           html += '  <td class="text-end"><button type="button" class="btn btn-danger btn-sm"><i class="fa-solid fa-minus-circle"></i></button></td>';
 *           html += '</tr>';
 *       $('#category-filter tbody').append(html);
 *     }
 *   });
 */

function ocAutocomplete(options) {
	const inputSelector = options.inputSelector;
	const url = 'index.php?route=' + options.route + '&user_token=' + options.userToken;
	const valueKey = options.valueKey;
	const labelKey = options.labelKey;
	const prependNone = (options.prependNone !== undefined) ? options.prependNone : false;
	const onSelect = options.onSelect;

	$(inputSelector).autocomplete({
		'source': function (request, response) {
			$.ajax({
				url: url + '&filter_' + labelKey + '=' + encodeURIComponent(request),
				dataType: 'json',
				success: function (json) {
					if (prependNone !== false) {
						let noneLabel = (typeof prependNone === 'string') ? prependNone : '';
						let noneItem = {};
						noneItem[valueKey] = '0';
						noneItem[labelKey] = noneLabel;
						json.unshift(noneItem);
					}

					response($.map(json, function (item) {
						return {
							value: item[valueKey],
							label: item[labelKey]
						};
					}));
				}
			});
		},

		'select': function (item) {
			if (typeof onSelect === 'function') {
				onSelect(item);
			}
		}
	});
}
