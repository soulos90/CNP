CREATE TABLE Students (
    StudentId INT NOT NULL AUTO_INCREMENT,
    StudentName VARCHAR(255) NOT NULL,
    Img LONGBLOB,
    RelativeName VARCHAR(255) NOT NULL,
    AbsentToday BOOL NOT NULL DEFAULT 0,
    PRIMARY KEY (StudentId)
);

CREATE TABLE Relatives (
    StudentId INT NOT NULL,
    RelativeName VARCHAR(255) NOT NULL,
    RelativeEmail VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    PRIMARY KEY (StudentId, RelativeName)
);

CREATE TABLE ClassSession (
    StudentId INT NOT NULL,
    CurrentDate DATE DEFAULT (getdate()),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    PRIMARY KEY(StudentId, CurrentDate)
);

CREATE TABLE Activities(
    ActivityId INT NOT NULL AUTO_INCREMENT,
    ActivityName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ActivityID)
);

CREATE TABLE DailyActivites (
    StudentId INT NOT NULL,
    CurrentDate DATE NOT NULL,
    ActivityId INT NOT NULL,
    CurrentTime DATETIME DEFAULT (getdate()),
    FOREIGN KEY (CurrentDate) REFERENCES ClassSession(CurrentDate),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentId),
    FOREIGN KEY (ActivityId) REFERENCES Activities(ActivityId),
    PRIMARY KEY(StudentID, CurrentDate, CurrentTime)
);

CREATE TABLE Behavior (
	StudentId INT NOT NULL,
    CurrentDate DATE NOT NULL,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    PRIMARY KEY(StudentId, CurrentDate)
);

CREATE TABLE DailyStudentNotes (
	StudentId INT NOT NULL,
    CurrentDate DATE NOT NULL,
    StudentNoteId INT NOT NULL AUTO_INCREMENT,
    NoteContent VARCHAR(512),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CurrentDate) REFERENCES ClassSession(CurrentDate),
    PRIMARY KEY (StudentId, CurrentDate, StudentNoteId)
);

CREATE TABLE Schedual (
    StudentId INT NOT NULL,
    Monday BOOL NOT NULL DEFAULT 0,
    Tuesday BOOL NOT NULL DEFAULT 0,
    Wednesday BOOL NOT NULL DEFAULT 0,
    Thursday BOOL NOT NULL DEFAULT 0,
    Friday BOOL NOT NULL DEFAULT 0,
    Saturday BOOL NOT NULL DEFAULT 0,
    Sunday BOOL NOT NULL DEFAULT 0,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    PRIMARY KEY (StudentId)
);

CREATE TABLE Administer (
	AdminId INT NOT NULL AUTO_INCREMENT,
    AdminName VARCHAR(255) NOT NULL,
    AdminPass VARCHAR(255) NOT NULL,
    AdminImg LONGBLOB,
    AdminEmail VARCHAR(255) NOT NULL,
    AdminEmailPass VARCHAR(255) NOT NULL,
    PRIMARY KEY (AdminId)
);

CREATE TABLE AdminNotes(
	AdminId INT NOT NULL,
	CurrentTime DATETIME NOT NULL DEFAULT (getdate()),
    AdminNoteId INT NOT NULL AUTO_INCREMENT,
    NoteContent VARCHAR(512),
    FOREIGN KEY (AdminId) REFERENCES Administer(AdminId),
    PRIMARY KEY (AdminId, AdminNoteId)
);