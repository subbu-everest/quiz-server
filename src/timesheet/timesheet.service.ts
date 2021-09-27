import { getTimesheet } from './timesheet.dao';
import { getCurrentDate } from '../date.utility';

function isWeekend(newDate: Date) {
    return [0, 6].includes(newDate.getDay());
}

function getPastNthDay(dayIndex: number) {
    const currentDate = getCurrentDate();
    const newDate = new Date(currentDate);
    newDate.setDate(currentDate.getDate() - dayIndex);
    return newDate;
}

function prepareLastDates(days: number) {
    const dates = [];
    let dayIndex = 0;
    while (days) {
        const newDate = getPastNthDay(dayIndex + 1);
        if (!isWeekend(newDate)) {
            dates.push(newDate.toISOString().slice(0, 10));
            days = days - 1;
        }
        dayIndex++;
    }
    return dates;
}

export function filledLastTimesheetContinuously(days: number): boolean {
    const timesheet = getTimesheet();
    const lastDates = prepareLastDates(days);
    const dates = timesheet.map(record => record.date);
    return lastDates.every(date => {
        return dates.indexOf(date) !== -1;
    });
}
