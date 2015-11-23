********************************************************************************
****  Index
********************************************************************************

Export Contents
Export Types
      Area of Interest (AOI)
      SSURGO
      STATSGO2
Unzipping Your Export
Importing the Tabular Data into a SSURGO Template Database
      Why Import the Tabular Data into a SSURGO Template Database?
      Microsoft Access Version Considerations and Security Related Issues
            Trusted Locations
            Macro Settings
      Importing Tabular Data
Spatial Data
      Spatial Data Format and Coordinate System
      Utilizing Soil Spatial Data
Terminology
      Area of Interest (AOI)
      Soil Survey Area
      SSURGO Template Database
      SSURGO
      STATSGO2
Obtaining Help

********************************************************************************
****  Export Contents
********************************************************************************

This export includes data for the following soil survey area(s):

SSA symbol:             MN013
SSA name:               Blue Earth County, Minnesota
SSA version:            12
SSA version est.:       09/16/2014 05:19:33 PM
Spatial format:         ESRI Shapefile
Coordinate system:      Geographic Coordinate System (WGS84)

This export also includes the following MS Access SSURGO template database:


********************************************************************************
****  Export Types
********************************************************************************

Three types of data exports are available.  See the "Terminology" section for 
descriptions of "Area of Interest," "SSURGO," and "STATSGO2."

    ****************************************************************************
    ****  Area of Interest (AOI)
    ****************************************************************************
    
    The data in an Area of Interest export include the following for a 
    user-defined area of interest:

          Soil Tabular Data
          Map Unit Polygons (where available)
          Map Unit Lines (where available)
          Map Unit Points (where available)
          Special Feature Lines (where available)
          Special Feature Points (where available)
          Special Feature Descriptions (where available)

    An AOI export can be downloaded from the "Your AOI (SSURGO)" section under 
    the "Download Soils Data" tab in the Web Soil Survey.

    The name of the export zip file will be in the form 
    wss_aoi_YYYY-MM-DD_HH-MM-SS.zip, e.g. wss_aoi_2012-09-24_12-59-37.zip.

    Note that the data for an Area of Interest is always SSURGO data.  
    Currently, the Web Soil Survey does not include an option to create an area 
    of interest for STATSGO2 data.
    
    ****************************************************************************
    ****  SSURGO
    ****************************************************************************
    
    The data in a SSURGO export include the following for a soil survey area:

          Soil Tabular Data
          Soil Survey Area Boundary Polygon
          Map Unit Polygons (where available)
          Map Unit Lines (where available)
          Map Unit Points (where available)
          Special Feature Lines (where available)
          Special Feature Points (where available)
          Special Feature Descriptions (where available)

    A SSURGO export can be downloaded from the "Soil Survey Area (SSURGO)" 
    section under the "Download Soils Data" tab in the Web Soil Survey.

    The export zip file will be named in the form soil_**###.zip, where ** is 
    a two character state or territory Federal Information Processing Standard 
    (FIPS) code, in uppercase, and ### is a three digit, zero-filled integer, 
    e.g. soil_NE079.zip.
    
    ****************************************************************************
    ****  STATSGO2
    ****************************************************************************
    
    The data included in a STATSGO2 export include the following:

          Soil Tabular Data
          Map Unit Polygons

    A STATSGO2 export can be downloaded from the "U.S. General Soil Map 
    (STATSGO2)" section under the "Download Soils Data" tab in the Web Soil 
    Survey.

    If data for the entire STATSGO2 coverage is downloaded, the export zip file 
    will be named gmsoil_us.zip.

    If data for only a single state is downloaded, the export zip file will be 
    named in the form gmsoil_**.zip, where ** is a two character state FIPS 
    code in lowercase, e.g. gmsoil_ne.zip.

********************************************************************************
****  Unzipping Your Export
********************************************************************************

See the "Terminology" section for descriptions of a "Soil Survey Area" and a 
"SSURGO template database."

Each data export (see "Export Types" section) is provided in a single zip file.  
The file unzips to a set of directories and files.  The following example is 
typical (a copy of soil_metadata_*.txt and soil_metadata_*.xml will be present 
for each SSURGO soil survey area included in an export):

      spatial (a directory)
      tabular (a directory)
      readme.txt (an instance of this document)
      soil_metadata_*.txt
      soil_metadata_*.xml
      soildb_*.mdb (a conditionally present SSURGO template database)

The spatial data files for your export, if any, will reside in a directory 
named "spatial."

The tabular data files for your export will reside in a directory named 
"tabular."

The readme.txt file is an instance of the file you are currently reading.  
Except for the "Export Contents" section, this file is identical for all 
exports.

The soil_metadata_*.txt file contains Federal Geographic Data Committee (FGDC) 
metadata (http://www.fgdc.gov/metadata) for each soil survey area, state, or 
country for which data was included in your export.  The file is in text 
(ASCII) format.  The "*" will be replaced by a soil survey area symbol 
(e.g. "ne079"), "us," or a two character U.S. state FIPS code in lowercase.  
Your export may include more than one of these files.

The soil_metadata_*.xml file contains Federal Geographic Data Committee (FGDC) 
metadata (http://www.fgdc.gov/metadata) for each soil survey area, state, or 
country for which data was included in your export.  The file is in XML format. 
The "*" will be replaced by either a soil survey area symbol (e.g. "ne079"), 
"us," or a two character U.S. state FIPS code in lowercase.  Your export may 
include more than one of these files.

The soildb_*.mdb file is an instance of a SSURGO template database.  The "*" 
will be replaced by either "US" or a two character state or territory FIPS code 
in uppercase.  This file will be present unless you specifically requested an 
export that doesn't include a SSURGO template database.

********************************************************************************
****  Importing the Tabular Data into a SSURGO Template Database
********************************************************************************

See the "Terminology" section for a description of "SSURGO template database."

    ****************************************************************************
    ****  Why Import the Tabular Data into a SSURGO Template Database?
    ****************************************************************************
    
    The tabular data is exported as a set of files in "ASCII delimited" format. 
    These ASCII delimited files do not include column headers.  Typically, it 
    is not feasible to work with the tabular data in this format.  Instead, you 
    should import the data from these files into the accompanying SSURGO 
    template database. 

    Importing the data into a SSURGO template database establishes the proper 
    relationships between the various soil survey data entities.  It also 
    provides access to a number of prewritten reports that display related data 
    in a meaningful way and gives you the option to create your own queries and 
    reports.  Creating queries and reports requires additional knowledge by the 
    user.
    
    ****************************************************************************
    ****  Microsoft Access Version Considerations and Security Related Issues
    ****************************************************************************
    
    All SSURGO template databases are in Microsoft Access 2002/2003 format.  
    Although this doesn't prevent you from opening them in Access 2007 or 
    Access 2010, the default security settings for Access 2007 or 2010 may 
    initially prevent the macros in the template database from working.  If you 
    get a security warning when you open a SSURGO template database, e.g. a 
    warning that the database is read-only, you may need to change your 
    Microsoft Access security settings.

    To check and/or adjust your Microsoft Access security settings in Access 
    2007 or 2010, start Access, click the Office Button at the top left of the 
    Access window, and then click the button labeled "Access Options" at the 
    bottom of the form.  From the "Access Options" dialog, select 
    "Trust Center" from the options to the left, and then select the button 
    labeled "Trust Center Settings" to the right.

    After selecting "Trusted Center Settings," you can address a security issue 
    two different ways.  From the left side of the Trust Center dialog, select 
    "Trusted Locations" or "Macro Settings."
    
        ************************************************************************
        ****  Trusted Locations
        ************************************************************************
        
        You can move the SSURGO template database to an existing trusted 
        location (if a trusted location has already been created), or you can 
        add a new trusted location and move the SSURGO template database to 
        that new trusted location.
        
        ************************************************************************
        ****  Macro Settings
        ************************************************************************
        
        Selecting "Enable All Macros" will allow the macros in the SSURGO 
        template database to run, but not without hazard.  Note the associated 
        warning: "not recommended; potentially dangerous code can run."  The 
        SSURGO template database does not contain hazardous code, but other 
        databases might.

        If you have trouble using the SSURGO template database, see the 
        "Obtaining Help" section for information on how to contact the Soils 
        Hotline.
        
    ****************************************************************************
    ****  Importing Tabular Data
    ****************************************************************************
    
    When you open a SSURGO template database, the Import Form should display 
    automatically if there are no Microsoft Access security related issues.  
    To import the soil tabular data into the SSURGO template database, enter 
    the location of the "tabular" directory into the blank in the Import Form.  
    Use the fully qualified pathname to the "tabular" directory that you 
    unzipped from your export file.

    For example, if your export file was named wss_aoi_2012-09-24_12-59-37.zip 
    and you unzipped the file to C:\soildata\, the fully qualified pathname 
    would be C:\soildata\wss_aoi_2012-09-24_12-59-37\tabular.

    The pathname between C:\soildata\ and \tabular varies by export type.  It 
    also varies: 

          for Area of Interest exports by export date and time,
          for SSURGO exports by the selected soil survey area, and
          for STATSGO2 exports by your selection of data for the entire U.S. or
          for a single state.

    After entering the fully qualified pathname, click the "OK" button.  The 
    import process will start.  The duration of the import process depends on 
    the amount of data being imported.  Most imports take less than 5 minutes, 
    and many take less than 1 minute.  The import for STATSGO2 data for the 
    entire United States takes longer. 

    Once the import process completes, the Soil Reports Form should display.

********************************************************************************
****  Spatial Data
********************************************************************************

    ****************************************************************************
    ****  Spatial Data Format and Coordinate System
    ****************************************************************************
    
    All spatial data is provided in ESRI Shapefile format in WGS84 geographic 
    coordinates.
    
    ****************************************************************************
    ****  Utilizing Soil Spatial Data
    ****************************************************************************
    
    Utilizing soil spatial data without having access to Geographic Information 
    System (GIS) software is effectively impossible.  Even if you have access 
    to GIS software, relating the soil spatial data to the corresponding soil 
    tabular data can be complicated.

    For people who have access to supported versions of ESRI's ArcGIS software, 
    we provide a Windows client application that is capable of creating soil 
    thematic maps using ArcMap and the Windows client application.  The name of 
    the application is "Soil Data Viewer."  For additional information see 
    http://www.nrcs.usda.gov/wps/portal/nrcs/detailfull/soils/home/?cid=nrcs142p2_053620.

********************************************************************************
****  Terminology
********************************************************************************

    ****************************************************************************
    ****  Area of Interest (AOI)
    ****************************************************************************
    
    In the Web Soil Survey, you can create an ad hoc "area of interest" by 
    using the navigation map and its associated tools.  You can pan and zoom to 
    a desired geographic location and then use the AOI drawing tools to 
    manually select an "area of interest."  An "area of interest" must be a 
    single polygon and the maximum area of that polygon (measured in acres) is 
    limited.
    
    ****************************************************************************
    ****  Soil Survey Area
    ****************************************************************************
    
    The SSURGO soil data for the U.S. and its territories are broken up into 
    over 3,000 soil survey areas.  A soil survey area commonly coincides with a 
    single county but may coincide with all or part of multiple counties and 
    may span more than one state.

    A soil survey area is identified by a "survey area symbol."  The symbol is 
    a two character state or territory FIPS code combined with a zero-filled, 
    three digit number.  For example, "NE079" is the survey area symbol for 
    Hall County, Nebraska.

    Although the STATSGO2 soil data is not partitioned into soil survey areas, 
    STATSGO2 soil data can be downloaded for a particular state or territory.
    
    ****************************************************************************
    ****  SSURGO Template Database
    ****************************************************************************
    
    A SSURGO template database is a Microsoft Access database in which the 
    tables and columns conform to the current SSURGO standard.  Exported soil 
    tabular data can be imported into a SSURGO template database.

    A SSURGO template database includes a number of prewritten reports that 
    display related data in a meaningful way.  You also have the option of 
    creating your own queries and reports in the database.  Creating queries 
    and reports requires additional knowledge.

    In addition to the national SSURGO template database, many state-specific 
    SSURGO template databases are available.  They typically include additional 
    state-specific reports.

    Whenever you export data from the Web Soil Survey, the most appropriate 
    SSURGO template database is automatically included.
    
    ****************************************************************************
    ****  SSURGO
    ****************************************************************************
    
    The SSURGO standard encompasses both tabular and spatial data.  SSURGO 
    spatial data duplicates the original soil survey maps.  This level of 
    mapping is designed for use by landowners and townships and for 
    county-based natural resource planning and management.  The original 
    mapping scales generally ranged from 1:12,000 to 1:63,360.  The original 
    maps from soil survey manuscripts were recompiled to scales of 1:12,000 or 
    1:24,000 for digitizing into the SSURGO format.  SSURGO is the most 
    detailed level of soil mapping published by the National Cooperative Soil 
    Survey.
    
    ****************************************************************************
    ****  STATSGO2
    ****************************************************************************
    
    The U.S. General Soil Map consists of general soil association units.  It 
    was developed by the National Cooperative Soil Survey and supersedes the 
    State Soil Geographic (STATSGO) dataset published in 1994.  STATSGO2 was 
    released in July 2006 and differs from the original STATSGO in that 
    individual state legends were merged into a single national legend, 
    line-join issues at state boundaries were resolved, and some attribute 
    updates and area updates were made.  STATSGO2 consists of a broad-based 
    inventory of soils and nonsoil areas that occur in a repeatable pattern on 
    the landscape and that can be cartographically shown at the scale used for 
    mapping (1:250,000 in the continental U.S., Hawaii, Puerto Rico, and the 
    Virgin Islands and 1:1,000,000 in Alaska).

    The same tabular data model is used by both SSURGO and STATSGO2.  STATSGO2, 
    however, does not include soil interpretations.  The "cointerp" table in 
    STATSGO2 will therefore always be empty.

********************************************************************************
****  Obtaining Help
********************************************************************************

To learn about the capabilities of a SSURGO template database, open the 
database, select the Microsoft Access "Reports" tab, and then double click the 
report titled "How to Understand and Use this Database."

If you require additional assistance, or have any questions whatsoever, please 
contact the Soils Hotline (soilshotline@lin.usda.gov).

