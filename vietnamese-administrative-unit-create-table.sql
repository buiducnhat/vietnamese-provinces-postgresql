
-- CREATE "AdministrativeRegions" TABLE
CREATE TABLE "AdministrativeRegions" (
	"Id" integer NOT NULL,
	"Name" varchar(255) NOT NULL,
	"NameEn" varchar(255) NOT NULL,
	"CodeName" varchar(255) NULL,
	"CodeNameEn" varchar(255) NULL,
	CONSTRAINT administrative_regions_pkey PRIMARY KEY ("Id")
);


-- CREATE "AdministrativeUnits" TABLE
CREATE TABLE "AdministrativeUnits" (
	"Id" integer NOT NULL,
	"FullName" varchar(255) NULL,
	"FullNameEn" varchar(255) NULL,
	"ShortName" varchar(255) NULL,
	"ShortNameEn" varchar(255) NULL,
	"CodeName" varchar(255) NULL,
	"CodeNameEn" varchar(255) NULL,
	CONSTRAINT administrative_units_pkey PRIMARY KEY ("Id")
);


-- CREATE "Provinces" TABLE
CREATE TABLE "Provinces" (
	"Code" varchar(20) NOT NULL,
	"Name" varchar(255) NOT NULL,
	"NameEn" varchar(255) NULL,
	"FullName" varchar(255) NOT NULL,
	"FullNameEn" varchar(255) NULL,
	"CodeName" varchar(255) NULL,
	"AdministrativeUnitId" integer NULL,
	"AdministrativeRegionId" integer NULL,
	CONSTRAINT provinces_pkey PRIMARY KEY ("Code")
);


-- "Provinces" foreign keys

ALTER TABLE "Provinces" ADD CONSTRAINT provinces_administrative_region_id_fkey FOREIGN KEY ("AdministrativeRegionId") REFERENCES "AdministrativeRegions"("Id");
ALTER TABLE "Provinces" ADD CONSTRAINT provinces_administrative_unit_id_fkey FOREIGN KEY ("AdministrativeUnitId") REFERENCES "AdministrativeUnits"("Id");


-- CREATE "Districts" TABLE
CREATE TABLE "Districts" (
	"Code" varchar(20) NOT NULL,
	"Name" varchar(255) NOT NULL,
	"NameEn" varchar(255) NULL,
	"FullName" varchar(255) NULL,
	"FullNameEn" varchar(255) NULL,
	"CodeName" varchar(255) NULL,
	"ProvinceCode" varchar(20) NULL,
	"AdministrativeUnitId" integer NULL,
	CONSTRAINT districts_pkey PRIMARY KEY ("Code")
);


-- "Districts" foreign keys

ALTER TABLE "Districts" ADD CONSTRAINT districts_administrative_unit_id_fkey FOREIGN KEY ("AdministrativeUnitId") REFERENCES "AdministrativeUnits"("Id");
ALTER TABLE "Districts" ADD CONSTRAINT districts_province_code_fkey FOREIGN KEY ("ProvinceCode") REFERENCES "Provinces"("Code");



-- CREATE "Wards" TABLE
CREATE TABLE "Wards" (
	"Code" varchar(20) NOT NULL,
	"Name" varchar(255) NOT NULL,
	"NameEn" varchar(255) NULL,
	"FullName" varchar(255) NULL,
	"FullNameEn" varchar(255) NULL,
	"CodeName" varchar(255) NULL,
	"DistrictCode" varchar(20) NULL,
	"AdministrativeUnitId" integer NULL,
	CONSTRAINT wards_pkey PRIMARY KEY ("Code")
);


-- "Wards" foreign keys

ALTER TABLE "Wards" ADD CONSTRAINT wards_administrative_unit_id_fkey FOREIGN KEY ("AdministrativeUnitId") REFERENCES "AdministrativeUnits"("Id");
ALTER TABLE "Wards" ADD CONSTRAINT wards_district_code_fkey FOREIGN KEY ("DistrictCode") REFERENCES "Districts"("Code");