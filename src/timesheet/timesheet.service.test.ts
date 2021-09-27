import { filledLastTimesheetContinuously } from './timesheet.service';
import { clearTimesheetStore, fillTimesheet } from './timesheet.dao';
import { setDate } from '../date.utility';

describe('Remind users if  they missed to fill timesheet for last two times in row', function() {
    it('should return true if the user fills the timesheet for last 2 days in row', function() {
        const day1 = {
            userId: 1,
            project: 'WWG',
            hours: 8,
            date: '2021-09-24',
        };
        const day2 = {
            userId: 1,
            project: 'WWG',
            hours: 4,
            date: '2021-09-23',
        };
        fillTimesheet(day1);
        fillTimesheet(day2);
        const expected = true;
        const days = 2;
        const result = filledLastTimesheetContinuously(days);
        expect(result).toEqual(expected);
    });

    it('should return false if the user did not fill the timesheet for last 2 days in row', function() {
        const days = 2;
        const expected = false;
        const result = filledLastTimesheetContinuously(days);
        expect(result).toEqual(expected);
    });

    it('if current day is Monday, it should return true if user filled timesheet on Thursday and Friday', function() {
        setDate(new Date('2021-09-27'));
        const day1 = {
            userId: 1,
            project: 'WWG',
            hours: 8,
            date: '2021-09-24',
        };
        const day2 = {
            userId: 1,
            project: 'WWG',
            hours: 4,
            date: '2021-09-23',
        };
        fillTimesheet(day1);
        fillTimesheet(day2);
        const expected = true;
        const result = filledLastTimesheetContinuously(2);
        expect(result).toEqual(expected);
    });

    afterEach(() => {
        clearTimesheetStore();
        setDate(new Date());
    });
});
