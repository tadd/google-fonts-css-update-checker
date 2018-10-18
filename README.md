Google Fonts CSS update checker
===============================

Check update and notify to rebuild new (possibly) modified CSS from
Google Fonts.

## Usage

At first, ensure to set 3 environment variables. (descriptions below)

Next, run `bundle exec ruby init.rb` to create a table.

At the end, run `bundle exec ruby check.rb` to check update of CSS.
Notification is sent to build new CSS if some update was found.

FYI: You may want to run `check.rb` periodically.  Heroku Scheduler
may help you if you use Heroku.

## Environment Variables

These are 3 environment variables.  All are required.

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
