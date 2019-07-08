String formatDate(DateTime dateTime) => "${dateTime.day}/"
    "${dateTime.month < 10 ? "0${dateTime.month}" : dateTime.month}/"
    "${dateTime.year}";
