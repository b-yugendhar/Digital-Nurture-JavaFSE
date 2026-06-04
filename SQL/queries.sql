1
-- select
-- u.full_name,
-- e.title,
-- e.city,
-- e.start_date
-- from users u
-- join registrations r
-- on u.user_id = r.user_id
-- join events e
-- on r.event_id = e.event_id
-- where e.status = 'upcoming'
-- and u.city = e.city
-- order by e.start_date;


2
-- select
-- e.event_id,
-- e.title,
--avg(f.rating) as avg_rating,
--count(f.feedback_id) as feedback_count
-- from events e
-- join feedback f
-- on e.event_id = f.event_id
-- group by e.event_id, e.title
-- having count(f.feedback_id) >= 10
-- order by avg_rating desc;

3
-- select
--u.user_id,
--u.full_name
-- from users u
-- where u.user_id not in (
--select distinct user_id
--from registrations
--where registration_date >= curdate() - interval 90 day
-- );

4
-- select
--e.title,
--count(s.session_id) as session_count
-- from events e
-- join sessions s
-- on e.event_id = s.event_id
-- where time(s.start_time) between '10:00:00' and '12:00:00'
-- group by e.event_id, e.title;
5
-- select
--e.city,
--count(distinct r.user_id) as total_registrations
-- from registrations r
-- join events e
-- on r.event_id = e.event_id
-- group by e.city
-- order by total_registrations desc
-- limit 5;

6
-- select
--e.title,
--count(case when resource_type = 'pdf' then 1 end) as pdf_count,
--count(case when resource_type = 'image' then 1 end) as image_count,
--count(case when resource_type = 'link' then 1 end) as link_count
-- from events e
-- left join resources r
-- on e.event_id = r.event_id
-- group by e.event_id, e.title;

7
-- select
-- u.full_name,
-- f.comments,
-- e.title
-- from feedback f
-- join users u
-- on f.user_id = u.user_id
-- join events e
-- on f.event_id = e.event_id
-- where f.rating < 3;

8
-- select
--e.title,
--count(s.session_id) as total_sessions
-- from events e
-- left join sessions s
-- on e.event_id = s.event_id
-- where e.status = 'upcoming'
-- group by e.event_id, e.title;

9
-- select
-- u.full_name,
-- e.status,
-- count(e.event_id) as total_events
-- from users u
-- join events e
-- on u.user_id = e.organizer_id
-- group by u.user_id, u.full_name, e.status;

10
-- select distinct
--e.event_id,
--e.title
-- from events e
-- join registrations r
-- on e.event_id = r.event_id
-- left join feedback f
-- on e.event_id = f.event_id
-- where f.feedback_id is null;

11
-- select
-- registration_date,
-- count(*) as user_count
-- from users
-- where registration_date >= curdate() - interval 7 day
-- group by registration_date
-- order by registration_date;

12
-- select
-- e.event_id,
-- e.title,
-- count(s.session_id) as total_sessions
-- from events e
-- join sessions s
-- on e.event_id = s.event_id
-- group by e.event_id, e.title
-- having count(s.session_id) = (
--select max(session_count)
--from (
--         select count(*) as session_count
--         from sessions
--         group by event_id
--     ) 
-- );

13
-- select
--e.city,
--avg(f.rating) as average_rating
-- from events e
-- join feedback f
-- on e.event_id = f.event_id
-- group by e.city;

14
-- select
-- e.title,
-- count(r.registration_id) as total_registrations
-- from events e
-- join registrations r
-- on e.event_id = r.event_id
-- group by e.event_id, e.title
-- order by total_registrations desc
-- limit 3;

15
-- select
-- s1.event_id,
-- s1.title as session1,
-- s2.title as session2
-- from sessions s1
-- join sessions s2
-- on s1.event_id = s2.event_id
-- and s1.session_id < s2.session_id
-- and s1.start_time < s2.end_time
-- and s1.end_time > s2.start_time;

16
-- select
-- u.user_id,
-- u.full_name
-- from users u
-- left join registrations r
-- on u.user_id = r.user_id
-- where u.registration_date >= curdate() - interval 30 day
-- and r.registration_id is null;
17
-- select
-- speaker_name,
-- count(*) as total_sessions
-- from sessions
-- group by speaker_name
-- having count(*) > 1;


18
-- select
--e.event_id,
--e.title
-- from events e
-- left join resources r
-- on e.event_id = r.event_id
-- where r.resource_id is null;


19
-- select
--e.title,
--count(distinct r.registration_id) as total_registrations,
--avg(f.rating) as average_rating
-- from events e
-- left join registrations r
-- on e.event_id = r.event_id
-- left join feedback f
-- on e.event_id = f.event_id
-- where e.status = 'completed'
-- group by e.event_id, e.title;

20
-- select
--u.user_id,
--u.full_name,
--count(distinct r.event_id) as events_attended,
--count(distinct f.feedback_id) as feedbacks_submitted
-- from users u
-- left join registrations r
-- on u.user_id = r.user_id
-- left join feedback f
-- on u.user_id = f.user_id
-- group by u.user_id, u.full_name;