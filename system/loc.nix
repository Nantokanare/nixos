{
  timezone,
  locale,
  extralocale,
  ...
}: {
  time.timeZone = timezone;

  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = extralocale;
    LC_IDENTIFICATION = extralocale;
    LC_MEASUREMENT = extralocale;
    LC_MONETARY = extralocale;
    LC_NAME = extralocale;
    LC_NUMERIC = extralocale;
    LC_PAPER = extralocale;
    LC_TELEPHONE = extralocale;
    LC_TIME = extralocale;
  };
}
