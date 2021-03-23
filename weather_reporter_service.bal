import ballerina/task;
import ballerina/time;
import ballerina/lang.runtime;

public function main(string... args) returns error? {
    time:Utc currentUtc = time:utcNow();

    time:Utc newTime = time:utcAddSeconds(currentUtc, 3);

    time:Civil time = time:utcToCivil(newTime);

    task:JobId id = check task:scheduleJobRecurByFrequency(new WeatherDetailsReporter(),
                                        1, startTime = time);

    runtime:sleep(12);

    check task:unscheduleJob(id);
}