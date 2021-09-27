interface ITimesheet {
  userId: number;
  project: string;
  hours: number;
  date: string;
}

export const timesheetStore: Array<ITimesheet> = [];

export function fillTimesheet(timesheet: ITimesheet) {
  timesheetStore.push(timesheet);
}

export function getTimesheet() {
  return timesheetStore;
}

export function clearTimesheetStore() {
  timesheetStore.length = 0;
}