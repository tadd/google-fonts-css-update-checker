DEPRECATED
==========

This tool was created primarily for
https://github.com/tadd/google-fonts-font-display-swap-site. But
now, we don't need to use it because Google officially provided
`display=swap` parameter of Google Fonts API natively.

https://developers.google.com/fonts/docs/getting_started#use_font-display

We're all happy, my repos is now deprecated and archived.
Thank you Google guys!

Google Fonts CSS update checker
===============================

Check update and notify to rebuild new (possibly) modified CSS from
Google Fonts.

## Usage

1. Ensure to set 3 environment variables. (descriptions below)
2. Run `bundle exec ruby init.rb` to create a table.
3. Run `bundle exec ruby check.rb` to check update of CSS.
   Notification is sent as HTTP POST to build new CSS, if some update
   was found.
4. Now you can follow Google's improvements.  Excellent.

FYI: You may want to run `check.rb` periodically.  Heroku Scheduler
may help you if you use Heroku.  Daily execution would be enough.

## Environment Variables

These are 3 required environment variables to run.

### `FAMILY`

Font famliy name.  This is passed directory as a part of URL, so be
sure to set URL-encoded string like `Noto+Serif+JP`.

### `DATABASE_URL`

Where SHA256 digest of CSS file stored.  DB is used to decide to
send build notification or not.  This mechanism helps to reduce
needless build.

### `BUILD_HOOK`

Where notified to build newer CSS.  Notification is sent via POST.
Currently, only Netlify is presumed.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/tadd/google-fonts-css-update-checker .
