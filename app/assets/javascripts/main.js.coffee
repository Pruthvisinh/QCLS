$(document).ready ->
  $('form.auto-submit select').change ->
    $(this).closest('form').submit()