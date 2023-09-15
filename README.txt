This is an ER diagram for COVID-19 contact tracing system.

Obviously the most important entity is the employee, who has multiple attributes, the primary key is the employee ID.
An employee will attend 0 or many meetings, and the meeting IDs will be recorded by the system.
What's more, an employee has name, smartphone number, optional email address, he/she might be scanned randomly as they
enters or exits, therefore, the body temperature will be recorded. High body temperature leads to mandatory COVID-19 test.
They also can self-report themselves if they don't feel well (having any if 5 symptoms of COVID-19).

One can attend serval meetings and meetings have to have multiple employees.
The meetings have start time, meeting room number and floor as attributes, this is for the potential contact tracing system to work.

Once a COVID-19 test required, a health report comes up with report ID, employee ID, test time, test location (onsite at company or by their choice) and test result.
One employee can have 0 or many health report, depend on the reality.

As long as the test result goes to positive, the relative employee will be noted as positive employee and initiates the contact tracing system.
Positive employee has positive employee ID differs from the original employee ID, and the one should get self-quarantine for 2 weeks. 
So they have health status (among 'sick', 'hospitalized' and 'well') updated everyday, quarantine time and quarantine place (usually their home), hospitalized positive employee do not need the quarantine place.
If they are feeling well after 2 weeks or it has been 2 weeks after being well for hospitalized ones, they are allowed to get back to work, and they are no longer positive employee.

As for the contact tracing system, every tracing has its own tracing ID as the primary key, and it finds all meetings the positive employee attends.
So a tracing might includes multiple meetings and one meeting might included by multiple tracings, unless all attendees are literally safe.
The tracing would not stop until all contacts are confirmed.

After tracing stops, notifications to employees will be created.
Notifications have two types, one is mandatory, which means the contact is close to the positive emplyee (they were in the same meeting room), and other is just a suggestion for those who were on the same floor.
These notifications have the information of confirmed meetings by meeting ID and the employee ID as target.
Those employees recived notification should take COVID-19 test as soon as possible.

And this is how the system works.