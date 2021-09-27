const currentDate = new Date();

export function setDate(date: Date) {
  currentDate.setDate(date.getDate());
}

export function getCurrentDate() {
  return currentDate;
}
