-- insert 20 records into the `services` table
INSERT INTO services (name, price, description)
VALUES ('Service 1', 10.50, 'Description 1'),
       ('Service 2', 20.00, 'Description 2'),
       ('Service 3', 15.75, 'Description 3'),
       ('Service 4', 30.25, 'Description 4'),
       ('Service 5', 12.50, 'Description 5'),
       ('Service 6', 25.00, 'Description 6'),
       ('Service 7', 18.75, 'Description 7'),
       ('Service 8', 35.50, 'Description 8'),
       ('Service 9', 11.25, 'Description 9'),
       ('Service 10', 22.00, 'Description 10'),
       ('Service 11', 17.75, 'Description 11'),
       ('Service 12', 28.25, 'Description 12'),
       ('Service 13', 14.50, 'Description 13'),
       ('Service 14', 27.00, 'Description 14'),
       ('Service 15', 19.75, 'Description 15'),
       ('Service 16', 33.50, 'Description 16'),
       ('Service 17', 16.25, 'Description 17'),
       ('Service 18', 24.00, 'Description 18'),
       ('Service 19', 21.75, 'Description 19'),
       ('Service 20', 37.25, 'Description 20');

-- insert 20 records into the `service_packages` table
INSERT INTO service_packages (name, description, image, min_price, max_price, status)
VALUES ('Package 1', 'Description 1', 'https://loremflickr.com/640/480/nature', 10.50, 30.25, 'Active'),
       ('Package 2', 'Description 2', 'https://loremflickr.com/641/480/nature', 12.50, 35.50, 'Inactive'),
       ('Package 3', 'Description 3', 'https://loremflickr.com/640/481/nature', 15.75, 28.25, 'Active'),
       ('Package 4', 'Description 4', 'https://loremflickr.com/640/482/nature', 11.25, 33.50, 'Inactive'),
       ('Package 5', 'Description 5', 'https://loremflickr.com/640/483/nature', 20.00, 27.00, 'Active'),
       ('Package 6', 'Description 6', 'https://loremflickr.com/640/484/nature', 14.50, 37.25, 'Active'),
       ('Package 7', 'Description 7', 'https://loremflickr.com/640/485/nature', 18.75, 24.00, 'Inactive'),
       ('Package 8', 'Description 8', 'https://loremflickr.com/640/486/nature', 22.00, 21.75, 'Active'),
       ('Package 9', 'Description 9', 'https://loremflickr.com/640/487/nature', 19.75, 35.50, 'Inactive'),
       ('Package 10', 'Description 10', 'https://loremflickr.com/641/480/nature', 16.25, 30.25, 'Active'),
       ('Package 11', 'Description 11', 'https://loremflickr.com/642/480/nature', 24.00, 28.25, 'Inactive'),
       ('Package 12', 'Description 12', 'https://loremflickr.com/643/480/nature', 25.00, 33.50, 'Active'),
       ('Package 13', 'Description 13', 'https://loremflickr.com/645/480/natureg', 27.00, 18.75, 'Active'),
       ('Package 14', 'Description 14', 'https://loremflickr.com/644/480/nature', 30.25, 37.25, 'Inactive'),
       ('Package 15', 'Description 15', 'https://loremflickr.com/646/480/nature', 28.25, 19.75, 'Active'),
       ('Package 16', 'Description 16', 'https://loremflickr.com/647/480/nature', 33.50, 35.50, 'Inactive'),
       ('Package 17', 'Description 17', 'https://loremflickr.com/652/480/nature', 35.50, 21.75, 'Active'),
       ('Package 18', 'Description 18', 'https://loremflickr.com/640/480/nature', 37.25, 30.25, 'Inactive'),
       ('Package 19', 'Description 19', 'https://loremflickr.com/650/480/nature', 24.00, 33.50, 'Active'),
       ('Package 20', 'Description 20', 'https://loremflickr.com/651/480/nature', 21.75, 18.75, 'Active');

-- -inser into service-package-details- --
INSERT INTO service_packages_detail (service_package_id, service_id)
VALUES (1, 1),
       (1, 3),
       (1, 5),
       (2, 2),
       (2, 4),
       (2, 6),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4);

INSERT INTO service_images (url)
VALUES ('https://loremflickr.com/640/481/food'),
       ('https://loremflickr.com/640/482/food'),
       ('https://loremflickr.com/640/483/food'),
       ('https://loremflickr.com/640/484/food'),
       ('https://loremflickr.com/640/485/food'),
       ('https://loremflickr.com/640/486/food'),
       ('https://loremflickr.com/640/487/food'),
       ('https://loremflickr.com/640/488/food'),
       ('https://loremflickr.com/640/489/food'),
       ('https://loremflickr.com/640/489/food'),
       ('https://loremflickr.com/641/480/food'),
       ('https://loremflickr.com/642/480/food'),
       ('https://loremflickr.com/643/480/food'),
       ('https://loremflickr.com/644/480/food'),
       ('https://loremflickr.com/645/480/food'),
       ('https://loremflickr.com/646/480/food'),
       ('https://loremflickr.com/647/480/food'),
       ('https://loremflickr.com/648/480/food');

INSERT INTO `service_image_detail` (service_id, service_images_id)
VALUES (1, 1),
       (1, 3),
       (1, 5),
       (2, 2),
       (2, 4),
       (2, 6),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4);

INSERT INTO service_package_review (review, start, date, service_package_id)
VALUES ('Great service package, highly recommended!', 5, '2022-01-01 10:00:00', 1),
       ('The service package was good, but could be better.', 4, '2022-02-01 11:00:00', 1),
       ('I really enjoyed the service package, will come back again!', 5, '2022-03-01 12:00:00', 2),
       ('Service package was okay, nothing special.', 3, '2022-04-01 13:00:00', 2),
       ('Highly professional service package, exceeded my expectations!', 5, '2022-05-01 14:00:00', 3),
       ('The service package was a bit pricey, but the quality was good.', 4, '2022-06-01 15:00:00', 3),
       ('Great value for money, highly recommend this service package!', 5, '2022-07-01 16:00:00', 4),
       ('Service package was good, but could be better.', 4, '2022-08-01 17:00:00', 4),
       ('The service package was excellent, highly recommended!', 5, '2022-09-01 18:00:00', 5),
       ('I had a good experience with the service package, but it was a bit too expensive.', 3, '2022-10-01 19:00:00',
        5),
       ('The service package was good, but I expected more.', 4, '2022-11-01 20:00:00', 6),
       ('I was satisfied with the service package, but there is room for improvement.', 4, '2022-12-01 21:00:00', 6),
       ('The service package was great, exceeded my expectations!', 5, '2023-01-01 22:00:00', 7),
       ('I had a good experience with the service package, but it was a bit overpriced.', 4, '2023-02-01 23:00:00', 7),
       ('The service package was excellent, highly recommended!', 5, '2023-03-01 00:00:00', 8),
       ('The service package was good, but I expected more.', 4, '2023-04-01 01:00:00', 8),
       ('I enjoyed the service package, but the price was a bit high.', 4, '2023-05-01 02:00:00', 9),
       ('The service package was good, but it could be better.', 3, '2023-06-01 03:00:00', 9),
       ('Great service package, highly recommended!', 5, '2023-07-01 04:00:00', 10),
       ('The service package was good, but the quality was inconsistent.', 3, '2023-08-01 05:00:00', 10);

