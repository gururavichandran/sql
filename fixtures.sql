
-- create
CREATE TABLE team (
  country TEXT NOT NULL
);

-- insert
INSERT INTO team VALUES ("india");
INSERT INTO team VALUES ("australia");
INSERT INTO team VALUES ("england");
INSERT INTO team VALUES ("pakistan");
INSERT INTO team VALUES ("srilanka");


select a.country as team1 , b.country as team2 from team a,team b where a.country>b.country





{
  "external_source": {
    "http": [
      {
        "endpoint": "http://crs-id-signup-v3-prod.crs-signup-id-v3.models.id.p.gods.golabs.io/v1/predict",
        "verb": "POST",
        "request_pattern": "{\n\t\"customer_id\": \"%s\",\n\t\"customer_created_at\": \"%s\",\n\t\"name\": \"%s\",\n\t\"phone\": \"%s\",\n\t\"email\": \"%s\",\n\t\"country\": \"%s\",\n\t\"x_location\": \"%s\",\n\t\"x_phonemodel\": \"%s\",\n\t\"x_deviceos\": \"%s\",\n\t\"rooted_flag\": %s,\n\t\"invalid_mac_address_flag\": %s,\n\t\"invalid_os_flag\": %s,\n\t\"app_id_valid\": %s,\n\t\"emulator_flag\": %s,\n\t\"vkey_shared_device_count\": %s,\n\t\"count_of_mdf_missing\": %s,\n\t\"similar_cust_accounts\": %s,\n\t\"ringo_component_size_number\": %s,\n\t\"gibberish_email_username_score_inhouse\": %s,\n\t\"x_forwarded_for\": \"%s\",\n\t\"booking_geohash\": \"%s\"\n}",
        "request_variables": "customer_id,customer_created_at,name,phone,email,country,x_location,x_phonemodel,x_deviceos,rooted_flag,invalid_mac_address_flag,invalid_os_flag,app_id_valid,emulator_flag,vkey_shared_device_count,count_of_mdf_missing,similar_cust_accounts,ringo_component_size_number,gibberish_email_username_score_inhouse,x_forwarded_for,booking_geohash",
        "stream_timeout": "6000",
        "connect_timeout": "6000",
        "capacity": "30",
        "fail_on_errors": false,
        "headers": {
          "Content-Type": "application/json"
        },
        "output_mapping": {
          "model_version": {
            "path": "$.model_version"
          },
          "customer_created_at": {
            "path": "$.customer_created_at"
          },
          "soft_risk_score": {
            "path": "$.soft_risk_score"
          },
          "hard_risk_score_1": {
            "path": "$.hard_risk_score_1"
          },
          "hard_risk_score_2": {
            "path": "$.hard_risk_score_2"
          },
          "phonemodel_idf": {
            "path": "$.phonemodel_idf"
          },
          "deviceos_idf": {
            "path": "$.deviceos_idf"
          },
          "gibberish_email_username_score_inhouse": {
            "path": "$.gibberish_email_username_score_inhouse"
          },
          "count_of_mdf_missing": {
            "path": "$.count_of_mdf_missing"
          },
          "email": {
            "path": "$.email"
          },
          "vkey_shared_device_count": {
            "path": "$.vkey_shared_device_count"
          }
        },
        "type": "gojek.esb.fraud.ConsumerSignupScoreMessage"
      }
    ]
  },
  "internal_source": [
    {
      "output_field": "customer_id",
      "value": "customer_id",
      "type": "sql"
    },
    {
      "output_field": "country",
      "value": "country",
      "type": "sql"
    },
    {
      "output_field": "event_timestamp",
      "value": "CURRENT_TIMESTAMP",
      "type": "function"
    }
  ]
}