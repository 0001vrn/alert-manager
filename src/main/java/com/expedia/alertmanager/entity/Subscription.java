/*
 * Copyright 2018 Expedia Group, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.expedia.alertmanager.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Entity(name = "subscription")
public class Subscription {
    public static final String EMAIL_TYPE = "EMAIL";
    public static final String PD_TYPE = "PD";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "metric_id")
    private String metricId;

    @Column(name = "detector_id")
    private String detectorId;

    private String name;

    private String description;

    private String type;

    private String endpoint;

    private String details;

    private boolean enabled;

    private String owner;

    @Column(name = "date_created")
    private Timestamp timestamp;

    public Subscription(String metricId, String detectorId, String name, String description,
                        String type, String endpoint, String owner) {
        this.metricId = metricId;
        this.detectorId = detectorId;
        this.name = name;
        this.description = description;
        this.type = type;
        this.endpoint = endpoint;
        this.owner = owner;
    }
}
