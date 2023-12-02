USE [master]
GO
/****** Object:  Database [BUPJ]    Script Date: 11/24/2020 3:11:32 AM ******/
CREATE DATABASE [BUPJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BUPJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BUPJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BUPJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BUPJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BUPJ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BUPJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BUPJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BUPJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BUPJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BUPJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BUPJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [BUPJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BUPJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BUPJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BUPJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BUPJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BUPJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BUPJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BUPJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BUPJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BUPJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BUPJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BUPJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BUPJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BUPJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BUPJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BUPJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BUPJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BUPJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BUPJ] SET  MULTI_USER 
GO
ALTER DATABASE [BUPJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BUPJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BUPJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BUPJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BUPJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BUPJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BUPJ] SET QUERY_STORE = OFF
GO
USE [BUPJ]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 11/24/2020 3:11:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Author] [nvarchar](250) NOT NULL,
	[DOI] [nvarchar](250) NULL,
	[Keywords] [nvarchar](1000) NOT NULL,
	[Details] [nvarchar](max) NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[ArticleFile] [nvarchar](250) NULL,
	[Views] [int] NOT NULL,
	[Downloads] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Call4Paper]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Call4Paper](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Details] [nvarchar](max) NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Call4Paper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[CategorySlug] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VolumeId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[EditorialAdvisors] [nvarchar](max) NOT NULL,
	[EditorialBoard] [nvarchar](max) NOT NULL,
	[ChiefPatronMessage] [nvarchar](max) NOT NULL,
	[EditorsNote] [nvarchar](max) NOT NULL,
	[ImageFile] [nvarchar](250) NULL,
	[IssuedSince] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Details] [nvarchar](max) NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageFile] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticContent]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NOT NULL,
	[PageDisplayName] [nvarchar](250) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[CategoryDisplayName] [nvarchar](250) NOT NULL,
	[PageContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_StaticContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volume]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volume](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Volume] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (17, 15, 1, N'Treatment of Love and Marriage in Emily Bronte’s Wuthering Heights and Rabindranath Tagore’s Shesher Kobita: A Comparative Study', N'1. Prokrity Ahmed 2. Md. Ruhul Quddus  3. Dr. Fahmida Haque ', NULL, N'Love, marriage, social contract, trans-cultural relation', N'<h5><b>Abstract</b></h5>Treatment of love and marriage in Emily Bronte’s Wuthering Heights (1847) and Rabindranath Tagore’s Shesher Kobita (1929) share certain universal appeal regarding love and marriage. This universality can be found in the love relationship between Catharine and Heathcliff in the Wuthering Heights and Amit and Labannya in Shesher Kobita. Standing at the same position regarding true love, Catherine and Amit neither deny their true love nor marry their beloved. They do not want to confine their love within the marriage bond which is more like a social contract than the eternal union of souls. The study observes the contrast as well as the similarities in the treatment of their relationship with their partners. The study also attempts to analyze the complexity of relationship of Catherine and Heathcliff illustrated by Emily Bronte and Amit and Labannya relationship by Rabindranath Tagore. This is a qualitative study which is explorative in nature. Content analysis method has been used in collecting the information. All data collected are from primary and secondary sources.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'f77232e6-f541-4699-bb0c-85f3b1f3db1a-01 - Treatment of Love and Marriage in Emily Bronte.pdf', 4, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (18, 15, 2, N'The Significance of Quality Dimensions and Behavioral Intention on the Resort Hotel Industry of Bangladesh', N'1. Shahrin Ashraf  2. Md. Tanvir Alam Himel ', NULL, N'service quality, servqual dimensions, behavioral intention, resort hotels', N'<h5><b>Abstract</b></h5>The history of resort hotel businesses has always been indicative of the influential roles played by the superior service. Thus, a thorough understanding of what necessarily the visitors cherish during their stay in resort facilities acts as the crucial antecedent for customer retention. The SERVQUAL, an effective instrument for assessing the quality of service, has been successfully measuring customers’ perception regarding hospitality industry. The purpose of this study is to empirically explore the magnitude of the dimensions of service quality and their impact on behavioral intention of the customer. Moreover, the level of importance of each dimension were also identified from the empirical findings. This study followed a mixed-method research design thus data had been collected from 200 sample through administering a structured questionnaire among various resort hotel guests. This study dealt with the resort hotel industry of Bangladesh and the findings implied that the physical establishment played the most significant role in hotel guest visit intention where service providers empathy came second to play the next most significant role. Moreover, the other three dimensions of service quality- assurance, responsiveness and reliability were emphasized by the resort hotel guests as deem relevant. The theoretical and managerial implication hinted on elevating the now-existing service quality performance by the resort hotel industry of Bangladesh to drive customer from their behavioral intention to repeat purchase and improve the industry’s performance along the way. <br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'662aaaf4-4b3a-4c44-9107-86551f7161cf-02 - The Significance of Quality Dimensions and Behavioral Intention on the Resort Hotel Industry of Bangladesh.pdf', 5, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (19, 15, 3, N'Bangladesh – India Border Odds and Measures to Way Forward', N'1. Md Mahbub-ul Alam', NULL, N'Porous Border, Informal Trade, Border Management, Migration, Remittance', N'<h5><b>Abstract</b></h5>Bangladesh and India share one of the most porous borders in the world. The faulty demarcation of the border was addressed since the independence of Bangladesh, and with the elapse of time a lot of progress is made to solve many border related issues. At the same time some odd happenings along the border are putting the management in challenge like informal trade; drug, arms and human trafficking; killing of Bangladeshi citizens etc. To address the situation many measures have already been taken by both the countries unilaterally as well as unitedly, and outcome is also positive. On the contrary, certain hypothetical understanding on migration and cross border terrorism at times act as barrier to make joint decision for both the countries and hinder the upliftment of the deprived bordering area people. The present research attempts to find out the better border management measures. To accomplish this study, focus group discussion, interviews and survey method have been applied for collecting data. Total sample size is 176. Creation of job opportunities, use of non-lethal weapons, restriction on drug production, simplification of visa system with modification on some minor issues are very much essential for better border management. Hence, policy and decision makers’ research-based concept, wisdom and sympathetic consideration of eradication of odds likely to be the appropriate measures in this regard.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'5ec92794-5d24-4743-b3fa-fde913b33a32-03 - Bangladesh – India Border Odds and Measures to Way Forward.pdf', 19, 1)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (20, 15, 4, N'Gender Mainstreaming in Health Governance: Exploring the Inadequacies in Addressing Women’s Health Issues ', N'1. Manila Khisa', NULL, N'Women, Gender Mainstreaming; Demographic Trends; Health Governance; Determinants of Health', N'<h5><b>Abstract</b></h5>Gender mainstreaming in health sector is a commonly applied strategy for providing equal health benefits to men and women by incorporating various implications of social construction of gender with health policies. However, gender mainstreaming, to a large extent is insufficient to address the rapidly growing health problems and frequently transforming health trends- such as ageing, increase of non-communicable diseases, mental health issues, environmental hazard borne diseases etc. While women’s reproductive health is the major concern of health governance both in the national and international levels- especially in developing countries, the newly emerging health issues of women remain almost invisible and unexplored. Using secondary data analysis method, this article has opted for qualitative approach to examine data collected from existing literature and tried to find out these changing health trends of women, the reason why they are undervalued and limitations of gender mainstreaming in addressing them. At the end, it has also suggested some potential policy approaches for the national and international health governing bodies to meet the limitations.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'219386ac-9222-48e4-9671-958dcedb8b02-04 - Gender Mainstreaming in Health Governance Exploring the Inadequacies in Addressing Women’s Health Issues.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (21, 15, 5, N'Not Humanity but ‘Other Factors’ Matter: Analysing the Challenges to Humanitarian Aid', N'1. Md. Abdul Hannan  2. Md. Rabiul Alam ', NULL, N'Humanitarian aid, humanity, politics, security, effectiveness', N'<h5><b>Abstract</b></h5>This paper endeavours to analyse how humanitarian aid is deviating from its objectives and principles day by day and thus making humanity subordinated to ‘other factors’. It first identifies the existing challenges that humanitarian aid has been facing for so long and then provides an analysis of those challenges to demonstrate how they subordinate humanity. For setting up the analytical framework, it employs the objectives and principles of humanitarian assistance accepted by the UN, the EU, the OECD, the ICRC and other leading organizations. Conducted in a qualitative manner, this research primarily relies on secondary data while primary data have also been used where required. In this connection, some other critical areas like politics, security, terrorism, religion and national interest have been connected and highlighted. Finally, on the basis of the findings, it concludes that in the operation and execution of humanitarian aid, the reason of humanity gets handicapped and compromised by the tentacles of politics, economy, terrorism, and religion.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'8f38b7ea-cb8c-4827-bc57-90b3d8727db8-05 - Not Humanity but ‘Other Factors’ Matter Analysing the Challenges to Humanitarian Aid.docx', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (22, 15, 6, N'Human Resource Disclosure Practices of Banks in Bangladesh', N'1. Mohammad Ali 2. K M Imam Ahsan', NULL, N'Human resource, human resource disclosure, content analysis, annual reports, banks', N'<h5><b>Abstract</b></h5>This paper attempts to investigate the extent of human resource (HR) disclosure in the annual report of banks based on a HR disclosure framework. The study covers 93 annual reports of 31 schedule banks selected from 57 schedule banks of Bangladesh. Content analysis has been used to find out data and then it was coded into four categories. A descriptive framework has been used to analyze the extent of disclosing information and analysis of variance (ANOVA) is performed to determine the variations among the categories of HR disclosure. The result shows that among the seven categories of disclosure, description of the staff is in top position and staff recruiting holds the last position according to the frequency of disclosure in the annual reports. The analysis supports that the extent of HR disclosure increased over the three years (2015-2017) only for the five categories of disclosure including training and human capital; staff compensation, incentives, motivation; interaction with staff; health and safety at work; and staff recruiting. The findings also endorse that there are significant variations of HR disclosure among the types of banks for four categories of disclosure including description of the staff; training and human capital; health and safety at work; and staff recruiting. Finally, the study reveals that the state-owned commercial banks tend to disclose more HR information than the other types of banks.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'cd310f00-55bc-4ab6-84e5-ba6dead7a8f1-06 - Human Resource Disclosure Practices of Banks in Bangladesh.pdf', 3, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (23, 15, 7, N'Contribution of Agricultural Sector to GDP and Unemployment Rate in Bangladesh: A Cointegration Analysis', N'1. Md. Anwar Hossen 2. Al Jamal Mustafa Shindaini 3. Abul Kalam', NULL, N'Agricultural Sector, Unemployment Rate, GDP Growth Rate, Cointegration, ARDL', N'<h5><b>Abstract</b></h5>Agricultural sector is one of the vital economic sectors in Bangladesh but nowadays its role in the national economy is declining at a rapid pace. Disregarding the rural segment either openly or secretly has driven the nation to a burdensome jobless circumstance. Unemployment is both a social and a political emergency of this contemporary world. This paper attempts to realize the connection between agricultural sector share on GDP and unemployment rate in the context of Bangladesh. For that, Johansen cointegration test has been applied to check the long run connections between the concerned factors. ARDL (Auto Regressive Distributed Lag) technique has been used to find out the coefficients of the factors and discover the short run as well as long run connection among the factors. The outcome of this research work states that the increasing trend in agricultural sector contribution to GDP may reduce unemployment rate in Bangladesh. The government should strengthen the peripheral farmers by assuming control over the overflow of agrarian products keeping in mind the end goal of designating it appropriately. However, increased attention in farming will produce facilitated work opportunities for the unemployed people of the nation.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'e2c359ad-1141-4067-a06d-734ac59ca368-07 - Contribution of Agricultural Sector to GDP and Unemployment Rate in Bangladesh A Cointegration Analysis.pdf', 2, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (24, 15, 8, N'Subscribing Solar Energy in Rural Household in Bangladesh: A Survey from Saint Martin’s Island', N'1. Mita Mazumder ', NULL, N'Solar Energy, Socio-Economic Character, Household Subscribers, Off-grid Island', N'<h5><b>Abstract</b></h5>Solar power is the most potential source among renewable energy sources in Bangladesh.The main objective of the study is to investigate the socio-economic impact of solar energy on the household respondents of Saint Martin’s Island of Bangladesh. Primary data were collected randomly from 119 sample household respondents by questionnaire survey method. Stratified sampling method was used to collect data for analysis. The findings of the study reveal that the majority of households using solar panel are headed by male and they are dependent on loan for installing solar panel. On the impact of using solar panel, 93% of the respondents expressed that their education level has increased; 87% of them reported that their economic condition has improved; and 94% admitted that their life standard has improved after installing solar panel. They also mentioned that they are getting some benefits from solar energy over the other sources of energy like kerosene, wood, charcoal etc.&nbsp; This study will be helpful to concerned parties in Bangladesh to emphasize the need for spreading the uses of solar panel in rural Bangladesh.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'3041cc65-064d-4fd4-9c0f-5d63675c753a-08 - Subscribing Solar Energy in Rural Household in Bangladesh A Survey from Saint Martin’s Island.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (25, 15, 9, N'Academic Compatibility and Job Satisfaction: An Inter-Services Comparative Study', N'1. Nigar Sultana  2. Md. Mahedi Hasan  3. Mohammad Tauhidul Islam ', NULL, N'Academic Compatibility, Job Satisfaction, Structural Equation Model', N'<h5><b>Abstract</b></h5>Though a substantial number of researches for finding the factors responsible for job satisfaction and its impact on employee performance in organisations can be found, an inclusive identification of the dynamics of job satisfaction that arises due to the academic compatibility of the employees is yet to be undertaken in the context of Bangladesh. It is argued that a comprehensive study to explore the effects of the compatibility of the educational background of the employees on their job satisfaction is relevant and necessary. It is also argued that this effect may not be similar in different types of organisations, so, the inter service comparison among them is also important. This study has included different types of organisations. Data was collected from 288 employees having a minimum number of 30 from each type of organisation by using stratified random sampling technique. This study has used Structural Equation Modeling (SEM) to address the simultaneous behaviours of the selected variables. It is seen that educational compatibility has significant influence on the job satisfaction as well as job performances of the employees. But the effect and its significance are not same in the organisations of different nature. Based on the responses from the faculties of the universities, it is found that educational compatibility has significant effect on job satisfaction of the employees which is positive. In case of private bank employees, it is found that the educational background has no significant effect on their job satisfaction. It is also seen that those who had aim and plan to join in this profession are more satisfied.&nbsp; The findings of this paper give some guidelines to the policy makers to understand the current scenario and the expectation of the employees working in different organisations about their job satisfaction in reference to academic compatibility. Findings of the study and the experiences from the interviews with employees recommend that the government should devise an effective long run plan from the tertiary level of education by calculating the needs of subject specific employment for the organisations of the country which may improve the job satisfaction of the employees and in turn their performance and productivity which in the bigger picture helps the growth of national economy.<br>', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2), N'01165dd4-50b7-45a3-8b37-894edc80b2f7-09 - Academic Compatibility and Job Satisfaction An Inter-Services Comparative Study.pdf', 2, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (27, 16, 2, N'The Need for Recruitment of Own Manpower by Bangladesh Coast Guard', N'1. A M M M Aurangzeb Chowdhury', NULL, N'Coast guard, Recruitment, Specialized, Personnel, Capacity, Skills, Seafarers, Maritime', N'<h5><b>Abstract</b></h5><p>The creation of Bangladesh Coast Guard happened with the assurance of Bangladesh Navy to provide necessary manpower. As easy as it <br>sounded initially, the task became increasingly difficult and impracticable for both the forces. While Bangladesh Navy itself suffers <br>from the shortage of manpower, Bangladesh Coast Guard’s mandates rose multiple times, especially with the delimitation of maritime <br>boundary necessitating increase of personnel. Besides, Bangladesh Coast Guard’s specialized tasks entail specialized manpower which does <br>not come under the present ambit of Bangladesh Navy’s training scheme. Bangladesh Coast Guard therefore receives much lesser than <br>necessary people, who are also required to return to Bangladesh Navy after a certain period of duty. The short and uncertain tenure of <br>people is creating further problems like lack of continuity, lack of belongingness and consequently inability to retain specialized <br>knowledge. The study aims to assess the requirement of own manpower of Bangladesh Coast Guard through recruitment. This is a secondary <br>research where content analysis has been the mainstay of the study. Bangladesh Coast Guard is now compelled to look for solutions <br>through induction of its own manpower, where the experience of coast guards with rich background like the US, Indian or Japanese can be <br>of some reference. This way, Bangladesh Coast Guard is expected not only to release Bangladesh Navy from the obligation of providing its <br>manpower, but also to develop this very strategic asset in an optimum way, so as to meet the evolving challenges in maritime environment <br>in the future days to come. <br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'8de91de8-fe2d-423d-bda4-b59d83da2901-02 - The Need for Recruitment of Own Manpower by Bangladesh Coast Guard.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (28, 16, 3, N'Adolescents’ Self-development Amid Social Media Dominance: Challenges of Parenting in Bangladesh Perspective', N'1. Md Ashraful Islam', NULL, N'Social Media, Adolescent, Development, Parenting', N'<h5><b>Abstract</b></h5><p>Adolescents’ self-development is a harmonized process attained by instilling physical, cognitive, social, emotional and ethical <br>attributes in them. But the recent domination of ‘Social Media’ on the society has set barriers for the parents to breed those <br>attributes to the adolescents. This study firstly attempts to uncover how social media is affecting adolescents to stimulate their <br>self-development attributes. Afterwards, it critically examines the effects of social media dominance on ‘parenting’. This is an <br>exploratory and descriptive research. The research findings show that inappropriate digital literacy, unsuitable parenting style and <br>inconsistency in work-life balance of the parents are the core challenges that hinder adolescents’ self-development. Moreover, the <br>overall moral decay of the society in this ‘social media’ obsessive community also acts as the major barrier against good parenting <br>practices. To offset those challenges, the research proposes a three-dimensional methodology encircling a suggestive parenting approach, <br>institutional drive and individual self-awareness. The combination will implant harmonious self-development attributes to the <br>adolescents and protect them from the unknown adversaries of online world through ‘Social Media’. <br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'575cc760-0c07-4ebe-93f2-682d76d83822-03 - Md Ashraful Islam copy.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (29, 16, 4, N'Ensuring Service Quality in Cadet Colleges of Bangladesh: Challenges and Ways Forward', N'1. A K M Iqbal Azim, ndc, psc, G+, PhD ', NULL, N'Service quality, Expectation, Perception, Gap model and SERVQUAL', N'<h5><b>Abstract</b></h5><p>Service quality needs to be ensured in any educational institution. In the last decade, huge numbers of private and foreign schools/<br>colleges/universities have entered in Bangladesh to get the market share. They are trying to attract the stakeholders by ensuring <br>quality services. This study attempts to evaluate the service quality of Cadet Colleges of Bangladesh basing on SURVQUAL model and Gaps <br>model. This study has evaluated the quality of existing services through SERVQUAL model and measured service quality gaps of Cadet <br>Colleges through empirical survey based on quantitative approach. In the first stage, purposive sampling was used to select 4 boys’ <br>cadet colleges and 2 girls’ cadet colleges. In second stage, total 372 respondents were selected from all cadet colleges by convenient <br>sampling from different classes within cadets including their parents, teachers and employees. In third stage, quota sampling was used <br>within specific group of respondents. Primary data has been collected through questionnaire survey (structured) using 5-point Likert <br>scale and data has been analyzed by SPSS program. Findings of the gaps between expectation and perception are classified as ‘highly <br>critical’ (gap of 1.50 and more than 1.50), ‘critical’ (between less than 1.50 and more than 1.00) and as ‘less significant’ (below 1.<br>00) for further improvements of service quality. Based on challenges and ways forward any educational institution can formulate long <br>term service quality strategy.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'0c3b5e1f-bbae-4305-a76a-114fe76a5c4e-04 - Ensuring Service Quality in Cadet Colleges of Bangladesh Challenges and Ways Forward.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (30, 16, 5, N'Institutional Barriers in Popularizing Mobile Banking in Developing Nation:  Bangladesh Perspective', N'1. Md. Nokir Uddin', NULL, N'Mobile Banking, Institutions, Barriers, Popularizing', N'<h5><b>Abstract</b></h5><p>Like other developed and developing countries, there has been enormous development in mobile banking (M-banking) in Bangladesh in the <br>last few years. However, there remains numbers of opportunities and threats in the M-banking system of the country. The major threat of <br>M-banking is its non-adoption by the customers. This research focuses on the institutional barriers to M- banking implementation in <br>Bangladesh as a developing economy. In depth interviews along with observation technique have been conducted to collect qualitative data <br>for this study. It has been revealed from the qualitative information that a wide range of institutions, from government to private are <br>connected directly or indirectly to the implementation of M-banking. Research findings indicate that there has been a growing tendency <br>of adopting the M-banking financial services. But the aims and intentions cannot be converted into action for the lack of trust on <br>financial system issues such as the delivery channels, communication infrastructures, government rules and policies etc. However, there <br>is a preference for traditional banking systems and services rather than M-banking services. The study suggests that banks and other <br>financial organizations should embark on awareness campaign in order to overcome the challenges of popularizing this contemporary <br>banking method in a developing country like Bangladesh.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'20d81720-bfd2-440b-89e2-6df2359437f4-05 - Institutional Barriers in Popularizing Mobile Banking in Developing Nation Bangladesh Perspective.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (31, 16, 1, N'Regulatory Framework of Political Party Finance in Bangladesh: Some Issues and Observations', N'1. Dr. Md. Abdul Alim 2. Prof. Dr. M Abul Kashem Mozumder', NULL, N'Money in politics, Political finance, Election campaign funding, Non-election party funding, Donation, Regulatory framework ', N'<h5><b>Abstract</b></h5><p>No democracy in the world that functions without political parties; and the parties cannot work and survive without money. Therefore, <br>the parties require money during elections for campaign and between elections for running political programs. But, due to <br>non-transparency, political finance is a concern around the globe as it promotes political corruption by the electoral and political <br>stakeholders when there is no legal provision of effective disclosure and sanctions. Moreover, use of unlimited and unequalled money by <br>the candidates and parties in elections hampers the credibility of elections. Hence, an equitable system of political funding is a key <br>to ensure transparency that helps promoting genuine democratic elections. Although, there is no universally accepted model of political <br>finance, there are, however, internationally accepted guidelines and several best practices. This paper presents an analysis of the <br>political finance regulatory framework of Bangladesh 2018 with the objectives to identify the gaps between international guidelines and <br>that of Bangladesh’s law; and finally, to highlight the shortcomings with the objective to improve those.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'677396a4-5f68-45b7-93c3-6d79ad710d40-01 - Regulatory Framework of Political Party Finance in Bangladesh Some Issues and Observations.pdf', 10, 1)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (32, 16, 6, N'Bangladesh - India Land Border Management: A Study on Border Haats ', N'1. Md Anwar Shafique', NULL, N'India-Bangladesh land border management, Border trade, Border haat, Bilateral-relations, Border management', N'<h5><b>Abstract</b></h5><p>As a significant part of border management, the contribution of Border Haats (localized cross-border market places) in Border Area <br>Development Plan and Neighbourhood Policy is noteworthy. The present research attempts to find out the better Border Haats trade <br>management measures. To accomplish this study, focused group discussion, interviews and survey method have been applied for collecting <br>data. Total sample size is 150. It has been found that opening of border trade routes through Border Haats brings economic prosperity <br>and acts as a harbinger of change for the people living in remote border areas and has an encouraging impact on their psychology and <br>emotional well-being and offers them with a natural environment for better economic collaborations. The study puts forward some <br>recommendations which should be implemented to enhance the performance of Border Haats that will in turn contribute in further <br>strengthening the bilateral relations between Bangladesh and India.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'7c103df2-4923-4bae-8e8a-28d5b8ac395b-06 - Bangladesh - India Land Border Management.pdf', 1, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (33, 16, 7, N'Regional Transport Connectivity in South Asia - Is Bangladesh Ready?', N'1. Md. Zahirul Islam', NULL, N'Transport Connectivity in South Asia, Communication Network, Land Ports, Transit and Transshipment, Bangladesh', N'<h5><b>Abstract </b></h5><p>The process of globalization has brought about a surge in the economic integration and initiatives on transport connectivity among <br>countries and regions throughout the world. Considering the economic significance of transport communication network in the globalized <br>world, the Government of Bangladesh (GOB) has been pursuing seamless transport connectivity under different regional, sub-regional and <br>bilateral initiatives. The overarching goal of promoting transport connectivity is to integrate Bangladesh with regional economies so <br>that it can accelerate and sustain economic growth.&nbsp;&nbsp; In addition to that, a seamless transport network would enable the neighbouring <br>landlocked countries or territories to integrate with global economic activities. As the countries of the region work on towards an <br>early implementation of transport connectivity, this study embarks into a comprehensive examination of the related issues from <br>Bangladesh’s perspectives of preparation.&nbsp; Being located at the vital geographical location, Bangladesh plays an important role in <br>facilitating regional transport connectivity. Therefore, this study explores through the current status of communication infrastructures <br>in Bangladesh as well as the progress in implementing the plans to install and upgrade required facilities to promote transport <br>connectivity efficiently.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'1c93eee9-d4de-478f-9e4a-13e299c780aa-07 - Regional Transport Connectivity in South Asia - Is Bangladesh Ready.pdf', 1, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (34, 16, 8, N'Economics of Energy Efficiency: The Case of Natural Gas Utilization in the Boiler-using Industries of Bangladesh', N'1. Engr. Md. Anisur Rahman  2. Dr. A K M Nazrul Islam', NULL, N'Natural gas, Natural gas utilization efficiency, Financial analysis, Net present value, Internal rate of return, Cost-benefit analysis', N'<h5><b>Abstract</b></h5><p>The present paper deals with the cost-benefit analysis (CBA) for an energy-efficiency improvement project for the boiler-using <br>industries of Bangladesh. It considers five different price scenarios of natural gas (NG), a discount rate of 12% and the expected gas <br>savings of about 6.88% of the total gas consumption in these industries of Bangladesh. The output of CBA has been used to suggest <br>commensurate NG pricing and provide policy inputs for encouraging energy use efficiency among these end-users. The high IRR of 18%,which <br>is much greater that the hurdle rate 12%, at the present weighted average NG price of Tk.10.29 indicates that the project is worth <br>undertaking even at a financing rate below18% .NG price for which the project is financially viable (NPV=0) is Tk.9.52/cubic meter and <br>IRR at this price is 12.53% .The present industrial gas price is Tk.10.70 /cubic meter .Therefore, it is evident that this energy <br>efficiency project is financially acceptable at the present industrial price of natural gas. The IRR-NG price relationship reveals that <br>the project becomes more lucrative financially as NG price increases.<br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'fb548a97-09d8-4a71-a8f3-79a2ba8bd6e8-08 - Economics of Energy Efficiency The Case of Natural Gas Utilization in the Boiler-using Industries of Bangladesh.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (35, 16, 9, N'The Reasons of Preferring E-recruitment Media: An Empirical Study on Job Seekers of Bangladesh', N'1. Nahida Sultana 2.Nafia Sultana', NULL, N'E-recruitment, Job seekers, Company websites, Online job portal, Social networking sites', N'<h5><b>Abstract</b></h5><p>The study sets forth to explore the reasons of choosing online recruitment media by identifying some influential factors from the job <br>seekers perspective. Today organizations are becoming more online-centric while recruiting potential employees. For the sake of <br>attracting a large pool of candidates, organizations use certain e-recruitment sites. Hence, this is necessary for the recruiters to <br>distinguish what factors drive the job applicants to pick a particular site to apply. Job seekers prefer different e-recruitment media <br>for different reasons. Examining the factors that work behind preferring these sites is the main focus of our study. Eight factors are <br>taken into consideration in this study to know about job seekers’ preference for company websites, online job portals, and Social <br>Networking Sites (SNS). To gain the goal of the study, a survey was done on the job seekers of our country. A 24-item questionnaire has <br>been designed and the respondents were selected based on convenience sampling technique. 145 usable responses were received and Multiple <br>Regression Analysis was used to analyze the data. The outcome of the study is that quick search, easiness, adequate information, <br>fairness, and reliability are the most influencing factors to choose any specific e-recruitment media. Some problems faced by the job <br>seekers and their suggestions were also identified through the open-ended questions included in the questionnaire. Conclusions, <br>limitations and future directions have been narrated at the end. <br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'af707617-056c-4dcd-9e42-82e035cfad1c-09 - The Reasons of Preferring E-recruitment Media An Empirical Study on Job Seekers of Bangladesh.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (36, 16, 10, N'Impact of Customer-Based Brand Equity on Customers’ Willingness to Pay Premium Price: A Study on Jamuna Future Park', N'1. Shadrul Hassan Himel 2. Md. Tanvir Alam Himel', NULL, N'Customer-based brand equity, Loyalty, Perceived quality, Brand association, Brand awareness', N'<h5><b>Abstract</b></h5><p>In Bangladesh, shopping malls are increasing by leaps and bounds. The malls are in stiff competition with each other for capturing the <br>lion’s share of its customers. They just want to be ahead of pack by offering good quality products, appealing advertisements, and <br>different exciting facilities to their customers. Most of the time, organizations just ignore the phenomena that for being a sustainable <br>entity in the industry one must have a position in their customers’ mind. The position can be created through establishing a brand. <br>Brand is the result of all the strategies an organization takes to give customers a memorable experience with their organization. Brand <br>is the psychological mediator which leads a customer to pay premium price for their purchase. The study is conducted to find out the <br>facets of customer-based brand equity of a renowned shopping mall of Bangladesh that influences customers to pay premium price.&nbsp; To do <br>so, 196 samples were selected through judgmental sampling from Jamuna Future Park Shopping Mall. It evaluates the impact of independent <br>variables (easily imagine, top of mind awareness, up-market, proud to buy, trust, quality, consistency, varieties, facilities, loyalties,<br>) on customers’ intention to pay premium price at JFP. Among all the variables, customer loyalty, customer trust, top of mind awareness, <br>good quality and variation of shops influence customers to pay premium price in any of their purchase.&nbsp; <br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'03d000fe-785d-4289-b380-36bec690a034-10 - Impact of Customer-Based Brand Equity on Customers Willingness to Pay Premium Price A Study on Jamuna Future Park.pdf', 0, 0)
INSERT [dbo].[Article] ([Id], [IssueId], [SortOrder], [Title], [Author], [DOI], [Keywords], [Details], [PublishDate], [ArticleFile], [Views], [Downloads]) VALUES (37, 16, 11, N'Linking Intellectual Capital to Firm Performance', N'1. Dr. Jannatul Ferdaous 2.Mohammad Mizanur Rahman', NULL, N'Intellectual capital (IC), VAICTM method, Firm performance, Manufacturing firms, Dhaka stock exchange', N'<p></p><h5><b>Abstract</b></h5><p>The purpose of the study is to analyze the role of intellectual capital (IC) and its impact on the firms’ financial performance and <br>stock market performance in the context of Bangladesh. The study has followed a quantitative research design. Required data have been <br>collected during the period of 2007-2017 from 141 listed manufacturing firms in DSE through administering a data observation sheet. <br>Pulic’s VAICTM method has been used to determine the relevant elements of IC. The study has used a fixed-effect estimation technique for <br>balanced panel data (1,551 observations) to measure, describe, and analyze the relationship between IC and firm performance. The results <br>reveal mixed behavioral effects:the firms’ IC has a positive impact on financial performance although it has a negative impact on stock <br>market performance. The results also indicate that even if IC triggers a significant rise in the firms’ EPS, the firms’ can’t maximize <br>shareholders’ wealth due to their poor performance in the stock market of Bangladesh. The proposed models could be important tools for <br>managers to integrate IC in their decision process. The proposed models could also be important tools for investors to select their <br>portfolios that have a track record for continuous creation of value added (VA) in an efficient and sustainable way. <br></p>', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'fe4258ea-ef6f-4eea-a54d-d050a008fece-11 - Linking Intellectual Capital to Firm Performance.pdf', 0, 0)
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
SET IDENTITY_INSERT [dbo].[Call4Paper] ON 

INSERT [dbo].[Call4Paper] ([Id], [Title], [Details], [PublishDate], [ExpiryDate], [Active]) VALUES (1, N'Call 4 paper title 1', N'Call 4 paper details 1', CAST(N'2020-10-14T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-30T20:20:00.5400000' AS DateTime2), 0)
INSERT [dbo].[Call4Paper] ([Id], [Title], [Details], [PublishDate], [ExpiryDate], [Active]) VALUES (2, N'Call 4 paper title 2', N'Call 4 paper details 2', CAST(N'2020-10-15T05:00:48.4400000' AS DateTime2), CAST(N'2020-12-05T20:20:00.5400000' AS DateTime2), 1)
INSERT [dbo].[Call4Paper] ([Id], [Title], [Details], [PublishDate], [ExpiryDate], [Active]) VALUES (3, N'Call 4 paper title 3', N'Call 4 paper details 3', CAST(N'2020-09-01T15:58:09.7570000' AS DateTime2), CAST(N'2020-09-04T20:23:48.4970000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Call4Paper] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [SortOrder], [CategoryName], [CategorySlug]) VALUES (1, 4, N'Arts & Social Science', N'Arts-and-Social-Science')
INSERT [dbo].[Category] ([Id], [SortOrder], [CategoryName], [CategorySlug]) VALUES (2, 3, N'Business & Management', N'Business-and-Management')
INSERT [dbo].[Category] ([Id], [SortOrder], [CategoryName], [CategorySlug]) VALUES (3, 2, N'Science & Technology', N'Science-and-Technology')
INSERT [dbo].[Category] ([Id], [SortOrder], [CategoryName], [CategorySlug]) VALUES (6, 1, N'BUP Journal', N'BUP-Journal')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Issue] ON 

INSERT [dbo].[Issue] ([Id], [VolumeId], [SortOrder], [Title], [PublishDate]) VALUES (15, 9, 1, N'Issue - 1', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Issue] ([Id], [VolumeId], [SortOrder], [Title], [PublishDate]) VALUES (16, 10, 2, N'Issue - 2', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Issue] OFF
GO
SET IDENTITY_INSERT [dbo].[Journal] ON 

INSERT [dbo].[Journal] ([Id], [CategoryId], [SortOrder], [Title], [EditorialAdvisors], [EditorialBoard], [ChiefPatronMessage], [EditorsNote], [ImageFile], [IssuedSince]) VALUES (7, 6, 1, N'BUP JOURNAL, Volume - 7, Issue - 1, June - 2019', N'<table class="table table-bordered"><tbody><tr><td>Professor M Abul Kashem Mozumder, PhD <br>Pro-Vice Chancellor, BUP </td><td>Professor Dr. Muhammad Ruhul Amin <br>Department of International Relations <br>University of Dhaka <br></td></tr><tr><td>Brig Gen Dipak Kumer Paul Chowdhury, MPhil, MMEd &nbsp;<br>Dean, Faculty of Medical Science, BUP <br></td><td>Professor Dr. Mohammad Mozahidul Islam &nbsp;<br>Dept of History <br>Jahangirnagar University </td></tr><tr><td>Brig Gen Md. Siddiqul Alam Sikder, BSP, ndc, psc &nbsp;<br>Dean, Faculty of Security and Strategic Studies, BUP </td><td>Professor Dr. Mohammad Amzad Hossain <br>Chairman, Department of Economics <br>Jahangirnagar University <br></td></tr><tr><td>Brig Gen Md Zahidur Rahim, ndc, aswc, psc <br>Dean, Faculty of Science and Technology, BUP </td><td>Professor Dr. Zakir Hossain Bhuiyan <br>Department of Marketing <br>University of Dhaka </td></tr><tr><td>Brig Gen A K M Iqbal Azim, ndc, psc, G+, PhD <br>Dean, Faculty of Arts and Social Science, BUP </td><td>Professor Md. Ali Akkas <br>Chairman, Department of Management <br>University of Dhaka </td></tr><tr><td>Brig Gen Muhammad Wasim-Ul-Haq, ndu, afwc, psc <br>Dean, Faculty of Business Studies, BUP </td><td>Dr. Md. Abu Zafor &nbsp;<br>Professor and Chairman, Dept of English &nbsp;<br>Jagannath University, Dhaka </td></tr><tr><td>Dr. Kazi Maruful Islam <br>Professor, Department of Development Studies, University of Dhaka <br></td><td>Professor Dr. Md. Khabir Uddin <br>Department of Environment Science <br>Jahangirnagar University <br></td></tr><tr><td>Professor Dr. Abu Naser Ahmed Ishtiaque <br>Department of Marketing <br>University of Dhaka</td><td>Professor Dr. A. K. M. Waliul Islam <br>Chairman <br>Department of English <br>Independent University, Bangladesh (IUB) <br></td></tr><tr><td>Professor Dr. A.H.M. Abdul Baqee <br>Department of Geography and Environment <br>University of Dhaka </td><td>Professor Lailufer Yasmin <br>Department of International Relations <br>University of Dhaka <br></td></tr><tr><td>Dr. Nazrul Islam <br>Pro Vice Chancellor, Canadian University of Bangladesh </td><td>Prof. Dr. Rashed-Uz-Zaman <br>Department of International Relations <br>University of Dhaka </td></tr></tbody></table><br>', N'<p></p><h5><b>Chief Editor</b><br></h5><p>Brig Gen Syed Mofazzel Mawla (Retd) <br>Dean, Centre for Higher Studies and Research, BUP<br><br></p><h5><b>Associate Editors</b></h5><table class="table table-bordered"><tbody><tr><td>Captain M Niyamat Elahee, (L), NPP, psc, BN <br>Director <br>Centre for Higher Studies and Research, BUP</td><td>Dr. Md. Mohoshin Reza <br>Associate Professor, Department of English, BUP </td></tr><tr><td>Dr. Mohammad Nasir Uddin <br>Associate Professor, Department of ICT, BUP<br></td><td>Dr. Shamsunnahar Khanam <br>Associate Professor &amp; Chairman <br>Department of Environmental Science, BUP</td></tr><tr><td>Dr. Mohammad Rabiul Basher Rubel &nbsp;<br>Associate Professor &nbsp;<br>Dept of Management Studies, BUP<br></td><td>Maj Md Matiur Rahman, G, Arty <br>Coord to Dean <br>Centre for Higher Studies and Research, BUP</td></tr></tbody></table>', N'<h4 align="center"><b>Chief Patron </b></h4><h5 align="center"><b>Major General Md Emdad-Ul-Bari, ndc, psc, te <br>Vice Chancellor, BUP </b></h5><h5 align="center"><b><br></b></h5><p>It is my pleasure to know that the 1st issue, 7th volume of BUP Journal in going to be published soon. BUP Journal contains research papers of multidisciplinary nature, from individuals or group of individuals who are academicians or practitioners from diverse backgrounds. BUP always strives to maintain or uphold the quality in education and research, which is reflected in its work and products. I am sure that the upcoming BUP Journal will exhibit quality work through new ideas and innovations and will make contribution towards the advancement of scholarly knowledge and ideas. I am delighted to see that BUP Journal has transcended the expected level of importance within its small number of volumes since its beginning.<br>BUP, within a short span of time after its journey in 2008, has made worthwhile progress in its academic and research activities. The university offers regular under-graduate programmes under 16 different departments. Most of the departments also offer Master’s programmes. Our BUP graduates have started to join the mainstream jobs in the country making good impressions through their job performance. Equally, Center for Higher Studies and Research (CHSR), which offers research-based MPhil and PhD programmes, has earned name and fame among the academicians as well as practitioners.&nbsp; Here, a good number of academicians and professionals from different backgrounds of the society are enrolled. The ‘Bangabandhu Chair’ of the university offers splendid platform to undertake project and research works based on Bangladesh and related subjects. BUP, with its unique management, exemplary discipline, timely completion of courses and heart-soothing panoramic view, is very appealing to the researchers and students as their destination for higher studies. Our drive with utmost sincerity will continue to endorse the scholarly activities of researchers. <br>CHSR has been entrusted with the responsibility to publis</p>', N'<h4 align="center"><b>Chief Editor </b></h4><h5 align="center"><b>Brigadier General Syed Mofazzel Mawla (Retd) <br>Dean, Centre for Higher Studies and Research, BUP</b><br><br></h5><p>It is my pleasure for being able to bringing in light the BUP Journal of Volume 7, Issue 1. The BUP Journal contains insightful contemporary research papers which are reviewed by double-blind peer review process. As such, papers containing originality of thoughts with valuable arguments and findings are selected by the Editorial Board.<br>We have received a good number of papers covering interesting and thought provoking subject matters. Keeping in view our ‘Editorial Policy’ and ‘Guide to Prepare Manuscript’, the received papers were sent to the renowned reviewers having expertise on the related fields. Then, we shared reviewers’ feedback with the authors and encouraged them to rework as suggested by reviewers. Subsequently, after a rigorous selection process, this issue finally came out with 9 (nine) articles from several fields which includes Literature, Social Science, Business, HR and Health Issue.<br>Editorial Board is immensely indebted to the Chief Patron and respected Vice Chancellor Major General Md Emdad-Ul-Bari, ndc, psc, te for his passionate advice and visionary guidance all along the process.<br>We sincerely acknowledge the painstaking contributions of our esteemed reviewers towards enhancing the quality of the journal. I also convey my special thanks to the learned Advisory Board and Editorial members for their valuable inputs and feedback in selecting the papers and improving their standard to fit in with the current issue of BUP Journal. <br>The opinions expressed in the articles of this publication are those of the individual authors and do not necessarily reflect the policy and views of BUP. We are expecting high quality articles from the academicians, scholars and researchers of all fields for future publications. <br>We would sincerely accept any suggestions from our valued readers to improve the standard of BUP Journal in the coming days.<br></p>', N'2c7e5c71-4a87-4ac3-9d7e-18ee3722a979-Cover  Page Single - JPG.jpg', CAST(N'2019-06-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Journal] ([Id], [CategoryId], [SortOrder], [Title], [EditorialAdvisors], [EditorialBoard], [ChiefPatronMessage], [EditorsNote], [ImageFile], [IssuedSince]) VALUES (8, 6, 2, N'BUP JOURNAL, Volume - 7, Issue - 2, December - 2019', N'<table class="table table-bordered"><tbody><tr><td>Professor M Abul Kashem Mozumder, PhD <br>Pro-Vice Chancellor <br>Bangladesh University of Professionals </td><td>Professor Dr. Mohammad Mozahidul Islam <br>Department of History <br>Jahangirnagar University</td></tr><tr><td>Brig Gen A K M Iqbal Azim, ndc, psc, G+, PhD <br>Dean <br>Faculty of Arts and Social Sciences, BUP </td><td>Professor Dr. Rashed Uz Zaman <br>Department of International Relations <br>University of Dhaka <br></td></tr><tr><td>Brig Gen Muhammad Wasim-Ul-Haq, ndu, afwc, psc <br>Dean <br>Faculty of Business Studies, BUP </td><td>Professor Dr. M. Abu Misir <br>Department of Finance <br>Jagannath University </td></tr><tr><td>Professor Dr. Mohammad Thoufiqul Islam <br>Department of Management <br>University of Dhaka </td><td>Professor Dr. M. Anwar Hossen <br>Department of Sociology <br>University of Dhaka <br></td></tr><tr><td>Professor Dr. Md. Zakir Hossain Bhuiyan <br>Department of Marketing <br>University of Dhaka </td><td>Professor Dr. Md. Ismail Hosain &nbsp;<br>Department of Marketing<br>University of Dhaka </td></tr><tr><td>Professor Dr. Farid Uddin Ahmed <br>Department of Political Science <br>University of Dhaka </td><td>Professor Dr. Monira Jahan <br>Director <br>Institute of Education and Research <br>Jagannath University </td></tr><tr><td>Professor Dr. Md. Aynul Islam <br>Chairman <br>Department of Economics <br>Jagannath University </td><td>Professor Dr. AKM Waliul Islam <br>Dean <br>School of Arts &amp; Social Sciences <br>Southeast University <br></td></tr><tr><td>Professor Dr. Al Masud Hasanuzzaman <br>Department of Government &amp; Politics <br>Jahangirnagar University </td><td>Professor Dr. Md. Ashraful Islam Chowdhury <br>Department of Marketing <br>University of Dhaka </td></tr><tr><td>Professor Dr. Kazi Abu Taher <br>Department of Information and <br>Communication Technology <br>Bangladesh University of Professionals </td><td>Professor Dr. Md. Humayun Kabir <br>Department of Geography and Environment <br>University of Dhaka <br></td></tr><tr><td>Professor Dr. Md. Abu Zafor <br>Chairman <br>Department of English <br>Jagannath University </td><td><br></td></tr></tbody></table>', N'<h5><b>Chief Editor</b></h5>Brig Gen Syed Mofazzel Mawla (Retd) <br>Dean, Centre for Higher Studies and Research <br>Bangladesh University of Professionals <br><br><h5><b>Associate Editors </b></h5><table class="table table-bordered"><tbody><tr><td>A K M Maruf Hassan, (S), NUP, BCGMS, psc, BN <br>Director <br>Centre for Higher Studies and Research, BUP </td><td>Dr. Md. Mohoshin Reza <br>Associate Professor <br>Department of English, BUP </td></tr><tr><td>Dr. Mohammad Rabiul Basher Rubel &nbsp;<br>Associate Professor &amp; Chairman <br>Department of Business Administration in Management Studies, BUP</td><td>Lt Col Mahmud-Un-Nabi, psc, Arty <br>Additional Director <br>Centre for Higher Studies and Research BUP </td></tr><tr><td>Dr. Mohammad Nasir Uddin <br>Associate Professor &nbsp;<br>Department of Information and Communication Technology, BUP </td><td>Dr. Shamsunnahar Khanam <br>Associate Professor &amp; Chairman <br>Department of Environmental Science, BUP </td></tr><tr><td>Maj Md Matiur Rahman, G, Arty <br>Coord to Dean <br>Centre for Higher Studies and Research, BUP </td><td><br></td></tr></tbody></table><br>', N'<p></p><h4 align="center"><b>Chief Patron </b></h4><h5 align="center"><b>Major General Md Emdad-Ul-Bari, ndc, psc, te <br>Vice Chancellor, BUP </b></h5><h5 align="center"><b><br></b></h5><p>It is an inordinate pleasure and honour for me to see the 2nd Issue, Vol. VII of BUP Journal published. I welcome all who love feeling privileged to share the intellectual production of so many committed and thoughtful authors of the articles. Bangladesh University of Professionals (BUP) has always been on its sincere attempt to build up resources and power required for an institution of higher education, devoted to teaching and research to achieve ‘excellence through knowledge’. I hope that the newly originated knowledge and information shared by researchers and scholars will contribute to making the BUP Journal a venue for academic discourses which will also bring us a step forward to the intellectual realm of the globe.<br><br>The Centre for Higher Studies and Research (CHSR) of BUP was established in 2015 with a view to creating the home ground of intellectual seekers. Since then, the CHSR of BUP started conducting MPhil and PhD programmes. BUP has also set its another research ground through establishing the Bangabandhu Chair which has involved a good number of researchers from among the faculty members conducting research works on the father of the nation as well as Bangladesh Studies all the year round. It is mentionable that Bangabandhu Chair of BUP is going to publish a book titled Bangabandhu: A Profile in Leadership during the Mujib Barsho which will hopefully be a good collection of research works on the father of the nation.<br><br>In addition to the further development in research activities, BUP has entered the international arena of exploration of knowledge and intellectual cultivation through signing MOU with Macquarie University of Canberra and Western University of Australia. A joint research work has recently been undertaken by BUP in collaboration with University of Canberra. <br>BUP has developed as a fast growing, career focused modern public university with strong commitment to prepare future l</p>', N'<p align="center"></p><h4 align="center"><b>Chief Editor </b></h4><h5 align="center"><b>Brigadier General Syed Mofazzel Mawla (Retd) <br>Dean, Centre for Higher Studies and Research, BUP </b></h5><h5 align="center"><br></h5><p>This is, indeed, a pleasure for me to humbly shoulder this duty as editor of BUP Journal despite its being a constantly demanding task. On behalf of the Editorial Board, we are pleased to publish the 2nd Issue, Vol. VII of the journal. <br>Research is an enduring field with persistent and focused efforts leading to creating positive consequences. When research is conducted in multi-disciplinary fields of Sciences, Social Sciences, Humanities, Business or in the domain like Information Technology (IT), it has many fold impacts and implications not only for the industry, for the academia as well. Fostering research and creating a platform to publish quality research papers, based on empirical or scholarly research works, have been a continuous endeavour of the BUP Journal. In continuation to this endeavour, we are now happy to announce that the BUP Journal will soon be registered to enter into the era of E-ISSN.<br>Responses by the authors to our request for contributions have, recently, become overwhelming. And in spite of our best efforts, due to the decisions of editorial board and the referee review board, some of the papers could not be included in the present issue but this still does not restrict any of the authors to send original research articles, case studies, research reviews or empirical contributions for future publication in the journal. <br>The Editorial Board of the Journal is immensely indebted to the Chief Patron and the respected Vice Chancellor Major General Md Emdad- Ul- Bari, ndc, psc, te for his prudent advice and visionary guidance all along the process of publishing this issue. <br>We sincerely acknowledge the painstaking contribution of the esteemed reviewers to the enhancement of the journal’s quality. I also convey my special thanks to the learned Advisory Board and members of the Editorial Board of the journal for their valuable inputs and feedback in the process of selecting the papers and improving their standard to fit in the current issue. <br>The opinions expressed in the articles of this publication are those of the individual authors and do not necessarily reflect the policy or views of BUP. <br>We always welcome quality research papers from the academicians, scholars and researchers of all fields for the future publications of the journal. We also encourage high quality research contributions from among the learners of BUP. We sincerely accept constructive suggestions from our valued readers and scholars for continuous enhancement of the quality of BUP Journal in the upcoming days.<br></p>', N'0a64b9b9-0775-474a-b38b-1f2e6b64ef25-Cover Page - Single_2.jpg', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Journal] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Details], [PublishDate], [ExpiryDate]) VALUES (14, N'BUP Journal is indexed in DOAJ since the 1st of November 2020 and awarded with SEAL', N'<p>The journal “BUP Journal”, ISSN (print) 2219-4851, ISSN (online) 2219-4851, is set be a fully open-access one since October 20, 2020. We support the Open Access initiative, and this is our principled stand on the publishing model. We believe that articles should be freely accessible to readers. That is why, “BUP Journal”, as the copyright owner of all subscription articles, has made all articles of the Journal publicly available since January 2012.<br>We are glad to announce that on November 01, 2020, the application of the BUP Journal was accepted by Directory of Open Access Journals (DOAJ) and awarded with SEAL.<br></p>', CAST(N'2020-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-07T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (3, N'Slide3.jpg', N'BUP Lake', 5)
INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (4, N'Slide4.jpg', N'BUP Front', 4)
INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (17, N'0a97d793-dbe7-4583-9bd8-2685b75329bb-4.jpg', N'Meet and Greet', 6)
INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (18, N'0bd21d4b-6068-447d-8e36-065c8f11cf9c-5.jpg', N'Chief of Army Staff', 1)
INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (19, N'71f0e766-33fc-4f0b-8a42-e2336eaccf08-6.jpg', N'CAS with VC', 2)
INSERT [dbo].[Slider] ([Id], [ImageFile], [Name], [SortOrder]) VALUES (20, N'6feb3ae2-69b7-4be9-904d-f39fb6f6019f-7.jpg', N'Chief of Naval Staff', 3)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[StaticContent] ON 

INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (2, N'Terms', N'Terms & Conditions', N'Copyrights', N'Copyrights', N'Terms &amp; Conditions<br><br><p class="text-justify">Lorem ipsum dolor 
sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, 
maxime minus quam molestias corporis quod, ea minima accusamus. Rem 
magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem 
ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem
 ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem
 ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem 
ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem 
ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem 
ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex 
numquam, maxime minus quam molestias corporis quod, ea minima accusamus.
 Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur 
adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias
 corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (3, N'Privacy', N'Privacy & Policy', N'Copyrights', N'Copyrights', N'Privacy & Policy<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (4, N'Disclaimer', N'Disclaimer', N'Copyrights', N'Copyrights', N'Disclaimer<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (5, N'Archive', N'Archive', N'Copyrights', N'Copyrights', N'Archive<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (7, N'APC', N'Article Processing Charges (APC)', N'PublishingPolicies', N'Publishing Policies', N'Article Processing Charges (APC)<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (8, N'ArchivingPolicy', N'Self-archiving Policy', N'PublishingPolicies', N'Publishing Policies', N'<p>The author may deposit pre-print version of the paper (manuscript by the author, submitted to the journal, before peer-review and without any editorial amendments) to any platform anytime with acknowledgement to the Publisher and the Journal (acknowledgement should be made as follows: "This is a pre-peer-reviewed version of the paper submitted for publication to [name of the Journal] published by "BUP Journal").<br></p><p>The author may deposit post-print version of the paper (accepted version of the manuscript after peer-review and content amendments, but before copyediting, typesetting and proof correction) to the author''s personal website, provided that it is non-commercial, and to the repository of the author''s institution with acknowledgement of the Publisher and the Journal (acknowledgement should be made as follows: "This is an accepted peer-reviewed version of the paper. The published version of the article is available at "BUP Journal" at http://dx.doi.org/[DOI of the article]").<br></p><h5><b>Published version of an open-access article</b></h5><p>The Author may deposit published version of the paper (final edited and typeset version that is made publicly available by the Publisher and can be considered an article) to any institutional repository, and distribute and make it publicly available in any way with acknowledgement to the Publisher and the Journal (acknowledgement should be made as follows: "This is a published version of the paper, available at "BUP Journal" at http://dx.doi.org/[DOI of the article]")<br></p><blockquote class="blockquote"><p>Information about self-archiving can be found on each journal''s page.<br></p></blockquote><h5><b>"BUP Journal" copyright statement</b></h5><p>This web-site and all its contents is the property of "BUP Journal" and is protected by copyright law and other laws regarding intellectual property, if there is nothing different mentioned. All the rights are protected and the users of the site must ask for permission before using the materials of the site. Any content modification is the copyright and "BUP Journal" right’s abuse. While using this site, you agree not to use any devices and the software or automatized programs such as spiders, crawlers or robots to systematically index, download or republish any part of its content or information.<br>Any requests on permission to copy, share, depict and create the content of this site must be directed to journal@bup.edu.bd.<br><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (9, N'AuthorInstruction', N'Instructions for Authors', N'PublishingPolicies', N'Publishing Policies', N'<h5><b>General</b></h5><p>1. BUP Journal welcomes the submission of manuscripts concerning all academic disciplines. The learned authors are sincerely requested to read these guidelines with due care, as failure in doing so may result in rejection of the manuscript. The Editorial Board invites original manuscripts which fall within the editorial policy of the journal and are as concise as the subject matter and the research method permit. The Editorial Board reserves all the right to publish a paper. The board may not even publish any paper for reasons of protecting the interest and image of BUP even after being accepted by the reviewers. The manuscripts submitted are subjected to double blind review before consideration for publication. All manuscripts that meet our standard of excellence, regardless of the number and the nature of disciplines, may be published.<br><br>2. Submission of a manuscript or research note implies that it contains original work which has neither been published previously, nor put under consideration for publication elsewhere. It is expected that the manuscripts submitted to the Journal will be structured according to the established literary conventions of the discipline under research where these are organized/ sectioned in a manner that maximizes both the substance and clarity of the document.<br><br></p><h5><b>Abstract</b></h5>3. While outlining the abstract the authors should adhere to the following:<br><p></p><ul><li>Microsoft Word to be used</li><li>Placed at the beginning of every article</li><li>Font will be Times New Roman and size 12</li><li>Not more than 150 words in length</li><li>Should be limited to a single paragraph, and</li><li>Italicized</li><li>List of keywords to be placed after abstract</li></ul><p></p><h5><b>Length</b></h5><p>&nbsp;4. The word limit of the manuscript is expected to be within 4000 to 6000 words which includes the entire paper encompassing appendices, attachments and enclosures (without the references).<br></p><h5><b>Title of the Paper</b></h5><p>5. The title should be within 10-15 words. Headings<br>6. Headings must be concise, with a clear indication of the distinction between the hierarchy of headings.<br></p><h5><b>Front Page</b></h5><p>7. It should contain title of the paper, author''s name(s) (not more than three), affiliation, mailing addresses with e-mail, cell phone number, etc.<br></p><h5><b>Typing/Printing</b></h5><p>8. The text should be typed in Times New Roman while font size should be 12. Lines are to be justified at both left and right margins. The manuscript should be printed on one side of the paper.<br></p><h5><b>Paper Size</b></h5><p>9. The prescribed paper size is A4.<br></p><h5><b>Spelling</b></h5><p>10. British style of spelling is to be followed.<br></p><h5><b>Page Margins</b></h5><p>11. The margin should be one inch (1”) from all sides. Line Spacing<br>12. Double line spacing should be adopted.<br></p><h5><b>Page Numbers</b></h5><p>13. All pages are to be numbered at the bottom center.<br></p><h5><b>Figures</b></h5><p>14. All figures, including graphs, drawings and photos should have titles with chronological numbers. Appropriate captions are to be placed below the figures.<br></p><h5><b>Tables</b></h5><p>15. All tables are to be titled and numbered sequentially. It should be placed above the table. Source(s) or note(s) are to be placed immediately below the table. Single spacing is to be maintained for table contents.<br></p><h5><b>Structure of the Manuscript</b></h5><p>16. The manuscript should include sequentially the following: Abstract including keywords, Introduction, Problem Statement, Rationale of the Study, Research Questions/ Hypothesis (optional), Research objectives, Literature review focusing the research gap, Conceptual/ Theoretical Framework, Research Methodology, Discussion &amp; Findings, Recommendations. The author has the option to highlight problem statement, rationale of the study and research objectives within the scope of the introduction.<br></p><h5><b>Plagiarism</b></h5><p>17. Manuscript with plagiarized content will not be accepted. Any content copied from other materials must be placed under quotation. The paraphrased contents from other sources must be properly cited. Copying from other sources with appropriate citation must not exceed 15% of the total volume of the paper.<br></p><h5><b>Authorship and Authenticity</b></h5><p>18. For authorship (also for joint authorship of the same paper), a declaration of authenticity (including name(s), designation &amp; signature on a separate sheet of paper) must be submitted along with the manuscript.<br></p><h5><b>References</b></h5><p>19. All references and citations must be in Harvard style.<br></p><h5><b>Submission</b></h5><p>20. The soft-copy of the manuscript is to be submitted to journal@bup.edu.bd. Two hard-copies are to be submitted to the Chief Editor, BUP Journal, Centre for Higher Studies and Research, Bangladesh University of Professionals, Mirpur Cantonment, Dhaka - 1216.<br>&nbsp;&nbsp;&nbsp; <br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (10, N'Authorship', N'Authorship and Contributorship', N'PublishingPolicies', N'Publishing Policies', N'<p>We consider the author (co-author) of a research article as it is done by СОРЕ, that is the person who is the creator or originator of an idea (e.g., the author of the theory of relativity) or the individual or individuals who develop and bring to fruition the product that disseminates intellectual or creative works. The status of the article writer means that this person performed the research and did not infringe the copyright and other persons'' rights.<br></p><p>When defining authors and authorship, we also take into account and focus on Authorship and Authorship Responsibilities proposed by the Council of Science Editors (CSE) and Defining the Role of Authors and Contributors, determined by the International Committee of Medical Journal Editors (ICMJE).<br></p><p>We structure our relationship with the authors on trust and mutual respect. This means that the author, before sending an manuscript to the journal, has read and accepted the publication ethics principles, the "Publishing policies" and "Editorial policies", as well as the article publication terms. This means, among other things, that the authors present the results of a truly original research in their article. This means that the authors do not borrow other people''s ideas and texts in the course of the article preparation, do not send their article to several journals simultaneously, do not use the scientific potential of the journal team and reviewers to improve the article for the purpose of its subsequent sending to another journal. It also means that the authors studied the issue of possible conflicts of interest availability and made sure that they were absent.<br></p><p>We support and adopt 4 ICMJE authorship criteria:</p><ul><li>“Substantial contributions to the conception or design of the work; or the acquisition, analysis, or interpretation of data for the work; AND</li><li>Drafting the work or revising it critically for important intellectual content; AND</li><li>Final approval of the version to be published; AND</li><li>Agreement to be accountable for alla spects of the work inensuring that questions related to the accuracy or integrity of any part of the work are appropriately investigated and resolved.<br></li></ul><p>Contributors who meet fewer than all 4 of the above criteria for authorship should not be listed as authors, but they should be acknowledged”. The co-author must have an idea of all the work content, and not be responsible only for the part that he performed directly. Individuals who have not contributed significantly to the scientific results and the article preparation may be mentioned at the end of the article; the authors may express their gratitude with reference to how these persons contributed to this scientific work emergence.<br></p><p>We kindly hope that when you send an article to the editors of our journals, all those who have really contributed to its preparation will be taken into account and there will be no persons unrelated to its scientific content. We also hope that there will be no persons among the article writers who would like to claim authorship using authority over the true authors.<br></p><p>If the article has several authors, then they determine in dependently the corresponding author (they specify this in the Cover Letter who corresponds with the journal''s editors and controls for the article processing. It is the corresponding author who, on behalf of the whole team, announces certain decisions on the article (for example, a substantiated disagreement with the reviewers or the article recall). In order to avoid misunderstanding between the authors themselves or between the editorial staff and the authors, we send copies of the letters to all co- authors when maintaining correspondence to the corresponding author.<br></p><p>If, after the first article submission, changes are made in the composition of the coauthors'' team, then the persons who are excluded from the composition of the article writers'' team should send their consent to this to the journal staff. After this, a new Cover Letter will be issued and submitted to the editors with the signatures of all the co-authors.<br></p><p>If the article content (the research complexity and the scientific results obtained) is poorly correlated with the number of co-authors, the editorial staff may request information from the author''s team regarding the contribution of each of the co-authors to the research and the article preparation. Following the analysis of this information, co-authors may be offered to reduce their number and to mention the contribution of exempted persons in the text of the article.<br>Structure of the Paper and Manuscript Submission Guidelines, in the appropriate journal, recommends how to correctly specify the authors in the article.<br>Contributorship is the supporting process of article writers in obtaining scientific results. This concept is fully applicable to research articles and very rarely to articles of theoretical or observational nature. Contributorship may take various forms. For example, help or direct participation in a survey or scientific experiment. Participating individuals or institutions must be listed at the end of the article.<br></p><p>In all aspects of authorship and contributorship, we follow the СОРЕ principles and recommendations.<br><br></p><h5><b>Contributor roles defined</b></h5><p>Since January 2020, all journals of "BUP Journal" adopt CRediT Taxonomy to identify and record the individual contribution of each author to the article in order to avoid possible authorship disputes and conflicts. The roles describe each author''s specific contribution to the scholarly output. Not all roles can be used in the article and not all roles can be applied to all authors (that is, each author could contribute in several roles).<br>When submitting an article, the corresponding author should define the role of each author and specify the individuals or institutions, in the Acknowledgement, who have also contributed to the article but are not its authors. Authors make themselves mutually responsible for the role allocation and must confirm the assigned roles and Acknowledgements in the Cover Letter. All acknowledged individuals should agree to be acknowledged. Besides, an Editor may ask the corresponding author to provide the written consent from all acknowledged individuals for being mentioned in the Acknowledgement. Authors individual contribution will be stated in the article in the “Author contributions” section. Example:<br></p><p></p><h5><b>Author Contributions</b></h5><p>Conceptualization: Igor Paska, Larysa Satyr, Ruslana Zadorozhna. Data curation: Alla Shevchenko.<br>Formal analysis: Ruslana Zadorozhna.<br>Investigation: Ruslana Zadorozhna, Leonid Stadnik, Alla Shevchenko. Methodology: Igor Paska, Larysa Satyr, Ruslana Zadorozhna.<br>Project administration: Igor Paska, Larysa Satyr. Supervision: Igor Paska, Larysa Satyr.<br>Validation: Igor Paska, Larysa Satyr, Ruslana Zadorozhna. Visualization: Ruslana Zadorozhna, Leonid Stadnik. Writing – original draft: Ruslana Zadorozhna.<br>Writing – review &amp; editing: Ruslana Zadorozhna.<br></p><h5><b>Contributor roles defined (Information from CRediT – Contributor Roles Taxonomy)</b></h5><ol><li>Conceptualization – Ideas; formulation or evolution of overarching research goals and aims.</li><li>Data curation – Management activities to annotate (produce metadata), scrub data and maintain research data (including software code, where it is necessary for interpreting the data itself) for initial use and later re-use.</li><li>Formal analysis – Application of statistical, mathematical, computational, or other formal techniques to analyze or synthesize study data.</li><li>Funding acquisition – Acquisition of the financial support for the project leading to this publication.</li><li>Investigation – Conducting a research and investigation process, specifically performing the experiments, or data/evidence collection.</li><li>Methodology – Development or design of methodology; creation of models.</li><li>Project administration – Management and coordination responsibility for the research activity planning and execution.</li><li>Resources – Provision of study materials, reagents, materials, patients, laboratory samples, animals, instrumentation, computing resources, or other analysis tools.</li><li>Software – Programming, software development; designing computer programs; implementation of the computer code and supporting algorithms; testing of existing code components.</li><li>Supervision – Oversight and leadership responsibility for the research activity planning and execution, including mentorship external to the core team.</li><li>Validation – Verification, whether as a part of the activity or separate, of the overall replication/reproducibility of results/experiments and other research outputs.</li><li>Visualization – Preparation, creation and/or presentation of the published work, specifically visualization/data presentation.</li><li>Writing – original draft – Preparation, creation and/or presentation of the published work, specifically writing the initial draft (including substantive translation).</li><li>Writing – review &amp; editing – Preparation, creation and/or presentation of the published work by those from the original research group, specifically critical review, commentary or revision – including pre- or post-publication stages.<br><br></li></ol>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (11, N'CopyrightPermission', N'Copyright and Permissions', N'PublishingPolicies', N'Publishing Policies', N'<p>"BUP Journal" protects your rights as an author and guarantees that any juridical information and questions regarding author’s right will be regulated.</p><h5><b>Author''s rights</b></h5><p>Author''s rights to the contents of the article are determined depending on whether article is published in open-access or as subscription article.<br></p><h5><b>Subscription articles (hybrid journals)</b></h5><p>The publisher does not issue hybrid journals.<br></p><h5><b>Open-access articles (open-access journals)</b></h5><p>Authors whose articles are published in open-access retain all rights to the content of the articles. Open access articles are committed to be published under Creative Commons Attribution (CC BY) 4.0. This license allows others to distribute, edit, correct and build upon your work, even commercially, as long as they indicate your authorship. Detailed information at Creative Commons site: https://creativecommons.org/licenses/by/4.0/<br></p><h5><b>Permissions for open-access journals</b></h5><p>If the article is published in open-access under CC BY 4.0 or CC BY-NC 4.0 (which was possible till the 15th of December, 2018) licenses, users may reproduce it in accordance with their terms.<br>Additionally, if the article had been published under CC BY-NC 4.0 (this license authorizes others to download your works and share them with others as long as they indicate your authorship, but they can’t use them commercially in any case.), the use for the following commercial purposes requires permission:<br></p><ul><li>reproduction of content in a work or product intended for sale;</li><li>reproduction in presentations, brochures or other marketing materials used for commercial purposes;</li><li>distribution of the content to promote or market a person, product, course, service or organization;</li><li>text and data mining for the purpose of creating a saleable product or product which benefits from promotional or advertising revenue;</li><li>use of the content by a commercial entity or individual for the purposes of remuneration, directly or indirectly through sale, licensing, promotion or advertising;</li><li>linking to the content (in an email, webpage, portable electronic device or otherwise) for the specific purpose of marketing or advertising a person, product, course, service or organization for commercial benefit.<br></li></ul><p></p><blockquote>For further details and permission requests, please contact journal@bup.edu.bd.<br></blockquote><p><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (12, N'DevelopingCountryAPC', N'АРС for Developing Countries', N'PublishingPolicies', N'Publishing Policies', N'АРС for Developing Countries<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (13, N'DigitalPreservationPolicy', N'Digital Preservation Policy', N'PublishingPolicies', N'Publishing Policies', N'<p>All files are committed to Portico for preservation. Portico provides access to its library participants when specific conditions or "trigger events" occur, which cause journal titles to no longer be available from the publisher or any other source:<br></p><ul><li>When a publisher ceases operations and titles are no longer available from any other source.</li><li>When a publisher ceases to publish and offer a title, and it is not offered by another publisher or entity.</li><li>When back issues are removed from a publisher''s offering and are not available elsewhere.</li><li>Upon catastrophic failure by a publisher''s delivery platform for a sustained period of time.<br></li></ul><p>When e-journal titles have "triggered," they are available to all participants in the Portico E- Journal Preservation Service, regardless of whether the participating institution has previously licensed the content. Also, all versions of the papers (preprints, postprints and published versions) are stored in the publishing house''s archive.<br></p><p><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (14, N'EthicalOversight', N'Ethical Oversight', N'PublishingPolicies', N'Publishing Policies', N'<p>The policy of the journals, issued by "BUP Journal", concerning the oversight on how the ethical principles are observed is built on mutual trust of the publication process participants and hope for compulsory observance of all the publication ethics principles, described in the "Publishing policies" and "Editorial policies" of the journal.<br></p><p>We focus on the СОРE definition, of Ethical oversight, namely “Ethical oversight should include, but is not limited to, policies on consent to publication, publication on vulnerable populations, ethical conduct of research using animals, ethical conduct of research using human subjects, handling confidential data and of business/marketing practices”. Based on this definition, the editorial staff of the journals works under the issue of observing the ethical principles.<br></p><p>The journals will be bound to consider the appeals from the Ethics and Oversight Committee for professional and scientific activity concerning the non-observance of the ethical principles by our authors. We are also ready to consider other appeals in case they are not anonymous and substantiated.<br><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (15, N'OpenAccessReferenceMetadata', N'Open Access Metadata', N'PublishingPolicies', N'Publishing Policies', N'<p>BUP Journal shares the scientific community aspirations to ensure rapid and full access to scholarly results.<br></p><p>“By "open access" to this [research] literature, we mean its free availability on the public internet, permitting any users to read, download, copy, distribute, print, search, or link to the full texts of these articles, crawl them for indexing, pass them as data to software, or use them for any other lawful purpose, without financial, legal, or technical barriers other than those inseparable from gaining access to the internet itself. The only constraint on reproduction and distribution and the only role for copyright in this domain should be to give authors control over the integrity of their work and the right to be properly acknowledged and cited.” The Budapest Open Access Initiative, 2002.<br></p><p>That is why, articles published by BUP Journal are open access ones.<br></p><p>We are in favor of liberal self-archiving policy for authors, which promotes the dissemination of new knowledge and scholarly results.<br></p><p>We also believe that citation and the availability of information on it to the wider scientific community are important for the scientific knowledge dissemination (under the Creative Commons licenses), and we work to make citation data structured, separable and open.<br></p><ol><li>The articles published by BUP Journal are provided with digital object identifiers (DOIs) that contain all associated metadata and articles URL.</li><li>We support the following initiatives:<br></li></ol><p><font color="#FF0000">Budapest Open Access Initiative, and have added the company’s name to the declaration to support the open education too, List of Signatories.<br></font></p><p><font color="#FF0000">Berlin Declaration on Open Access to Knowledge in the Sciences and Humanities.</font><br></p><p>BUP Journal signed the “ORCID open letter”. According to the best practices, we require ORCID iDs for authors to make it easy for them to connect their iD to their contributions and affiliations.<br></p><p>The journal joined the Initiative for Open Citations to promote the availability of data on citations that are structured, separable and open.<br></p><ol><li>We follow the recommendations of Open Access Scholarly Publishers Association (OASPA), Directory of Open Access Journals (DOAJ).</li><li>BUP Journal joined the service Cited-by (Crossref), to make references metadata from all publications public and open.<br></li></ol>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (16, N'ReproducibilityRobustness', N'Reproducibility and Robustness', N'PublishingPolicies', N'Publishing Policies', N'<p>We are working to publish only those scholarly results which are reliable and obtained by the authors using the proven techniques and models. The author is obliged to test the models and methods for obtaining results as many as necessary to be sure of the error inability. Data deception or using unverified information by the authors is unethical and unacceptable.<br></p><p>The author should be ready for providing information and explanations as to how and using which detailed and meticulous accounts of methodologies and analytical procedures, methods and techniques the results were obtained, which are presented in the article submitted, as well as for providing access to primary data (according to Databases, data sets, and data accessibility – views and practices of scholarly publishers). We also ask our authors to keep primary data and calculations within a reasonable time period, and if possible (they are not covered by copyright, it does not require financial costs, etc.) to place raw data outputs of research, and sets or sub- sets of that data used in the article preparation on the open Internet. We fully support our authors'' initiatives towards data exchange.<br></p><p>The procedure (algorithm) for obtaining the result must be clearly and unambiguously written out with an indication of all nuances and limitations. This procedure (algorithm) should be such as to enable, if required, another person (skilled sufficiently) to re-conduct experiments, calculations or other actions and obtain the same result. We understand that in some cases or in some branches of knowledge, it is difficult or even impossible to provide reproducibility, but we defer to our authors professionalism and their well-reasoned approach to the issue.<br><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (17, N'SubscriptionPricingPolicy', N'Subscription Pricing Policy', N'PublishingPolicies', N'Publishing Policies', N'Subscription Pricing Policy<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (18, N'AboutBUPJournal', N'About BUP Journal (BUPJ)', N'Overview', N'Overview', N'BUP Journal (BUPJ) introduced by Bangabandhu University of Professionals (BUP) is committed to publishing high quality articles of faculty members and researchers of public and private universities, institutes and organizations both in home and abroad. BUPJ is a peer reviewed journal and its reviewers are scholars of different esteemed universities and institutes both in home and abroad. BUPJ has print (2219-4851) version for researchers. BUPJ has a long history of publishing journal in print since September 2012. It has published 15 issues in printed version.<br><br>BUPJ is a scholarly journal published from Centre for Higher Studies and Research (CHSR). In the year 2019, CHSR has decided to publish Online Issues in a year and the combining two issues, each volume will be published in printed form. The online papers will be published as an Open Access initiative and will be indexed in multiple international academic databases.<br><br>BUP Journal contains research based articles on development, security, education, science, technology, engineering, governance, disaster management, socio-economics, environment, medical science and other fields related to the interest of Bangladesh and/or world community.<br><br>Bangladesh University of Professionals (BUP) is committed to publish high-quality original works from academicians, scientists, engineers, business specialists, sociologists, social scientists and other scholars in aforementioned journal. We hope you will find the journal to be of international standard. It aims at creating scope for the researchers who want to enrich their knowledge through scholarly writings.<br><br>Our reviewers are selected from different universities and institutions of the country and abroad based on their excellence in corresponding academic and research field. The BUP Journal bears insightful contemporary research papers which are reviewed by double-blind peer review process to ensure research rigor and high quality. As such, the journal aspires to be vibrant, engaging and accessible, and at the same time integrative and challenging. Papers containing originality of thoughts with valuable arguments and findings are highly appreciated by the Editorial Board.<br><br>We have received a good number of articles covering interesting and thought provoking subject matters. Keeping in view the Editorial Policy and Guidelines for Submission of Articles, the initial scrutiny and sifting of papers were carried out by the Editorial Board. Thereafter, the articles were sent to the renowned reviewers, having expertise on the related fields. We shared reviewers’ feedback with the authors and encouraged them to rework as per reviewers’ suggestions. Subsequently, after a rigorous selection process, the issue finally comes out with multidimensional research-oriented scholarly articles.<br><br>As an intellectual mirror, BUP Journal reflects a great deal of individual as well as collective wisdom, sagacity and knowledge. BUPJ always carries similar essence and unfold vistas of new ideas and knowledge before our readers.<br>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (19, N'AimScope', N'Aim & Scope', N'Overview', N'Overview', N'BUP Journal (BUPJ) aims to provide expert and authoritative reviews and analyses of the most important developments across the rapidly expanding fields of energy efficiency, environmental performance, medical issues, management, leadership, social sciences and other fields related to the interest of Bangladesh and/or world community. It also provides a unique forum by bringing together invited contributions from the foremost experts, to examine new technologies and methodologies with the latest research on systems, simulations and standards.<br><p>Published bi-annually and peer-reviewed, BUPJ delivers an invaluable resource for management, medical and industry professionals, students, teachers and researchers in related fields.<br></p><p>Topics covered by BUPJ broadly include:</p><ul><li>Energy and Environment</li><li>Social Sciences</li><li>Security and Governance</li><li>Education</li><li>Management including Supply Chain Management</li><li>Leadership and</li><li>Medical</li></ul><p>All submitted manuscripts are subject to initial appraisal by the Editor, and, if found suitable for further consideration, will undertake peer review by independent, anonymous expert referees. All peer review is single blind, and submission is online.<br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (20, N'ArticleSubmission', N'Article Submission', N'Overview', N'Overview', N'Article Submission<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (21, N'AuthorGuideline', N'Author Guidelines', N'Overview', N'Overview', N'<p></p><h4><b>Guide to Prepare Manuscript for BUP Journal</b></h4><br><h5><b>General</b></h5>1. BUP Journal welcomes the submission of manuscripts concerning all academic disciplines. The learned authors are sincerely requested to read these guidelines with due care, as failure in doing so may result in rejection of the manuscript. The Editorial Board invites original manuscripts which fall within the editorial policy of the journal and are as concise as the subject matter and the research method permit. The Editorial Board reserves all the right to publish a paper. The board may not even publish any paper for reasons of protecting the interest and image of BUP even after being accepted by the reviewers. The manuscripts submitted are subjected to double blind review before consideration for publication. All manuscripts that meet our standard of excellence, regardless of the number and the nature of disciplines, may be published<br><br>2. Submission of a manuscript or research note implies that it contains original work which has neither been published previously, nor put under consideration for publication elsewhere. It is expected that the manuscripts submitted to the Journal will be structured according to the established literary conventions of the discipline under research where these are organized/ sectioned in a manner that maximizes both the substance and clarity of the document.<p></p><p></p><h5><b>Abstract</b></h5><p>3. While outlining the abstract the authors should adhere to the following:<br></p><ul><li>Microsoft Word to be used</li><li>Placed at the beginning of every article</li><li>Font will be Times New Roman and size 12</li><li>Not more than 150 words in length</li><li>Should be limited to a single paragraph, and</li><li>Italicized</li><li>List of keywords to be placed after abstract<br><br></li></ul><p><ul></ul></p><h5><b>Length</b></h5><p>4. The word limit of the manuscript is expected to be within 4000 to 6000 words which includes the entire paper encompassing appendices, attachments and enclosures (without the references).<br></p><p></p><h5><b>Title of the Paper</b></h5><p>5. The title should be within 10-15 words.<br></p><h5><b>Headings</b></h5><p>6. Headings must be concise, with a clear indication of the distinction between the hierarchy of headings.<br></p><p></p><h5><b>Front Page</b></h5><p>7. It should contain title of the paper, author''s name(s) (not more than three), affiliation, mailing addresses with e-mail, cell phone number, etc.<br></p><p></p><h5><b>Typing/Printing</b></h5><p>8. The text should be typed in Times New Roman while font size should be 12. Lines are to be justified at both left and right margins. The manuscript should be printed on one side of the paper.<br></p><p></p><h5><b>Paper Size</b></h5><p>9. The prescribed paper size is A4.<br></p><p></p><h5><b>Spelling</b></h5><p>10. British style of spelling is to be followed.<br></p><p></p><h5><b>Page Margins</b></h5><p>11. The margin should be one inch (1”) from all sides.<br></p><p></p><h5><b>Line Spacing</b></h5><p>12. Double line spacing should be adopted.<br></p><p></p><h5><b>Page Numbers</b></h5><p>13. All pages are to be numbered at the bottom center.<br></p><p></p><h5><b>Figures</b></h5><p>14. All figures, including graphs, drawings and photos should have titles with chronological numbers. Appropriate captions are to be placed below the figures.<br></p><h5><b>Tables</b></h5><p>15. All tables are to be titled and numbered sequentially. It should be placed above the table. Source(s) or note(s) are to be placed immediately below the table. Single spacing is to be maintained for table contents.<br></p><p></p><h5><b>Structure of the Manuscript</b></h5><p>16. The manuscript should include sequentially the following: Abstract including keywords, Introduction, Problem Statement, Rationale of the Study, Research Questions/ Hypothesis (optional), Research objectives, Literature review focusing the research gap, Conceptual/ Theoretical Framework, Research Methodology, Discussion &amp; Findings, Recommendations. The author has the option to highlight problem statement, rationale of the study and research objectives within the scope of the introduction.<br></p><h5><b>Plagiarism</b></h5><p>17. Manuscript with plagiarized content will not be accepted. Any content copied from other materials must be placed under quotation. The paraphrased contents from other sources must be properly cited. Copying from other sources with appropriate citation must not exceed 15% of the total volume of the paper.<br></p><p></p><h5><b>Authorship and Authenticity</b></h5><p>18. For authorship (also for joint authorship of the same paper), a declaration of authenticity (including name(s), designation &amp; signature on a separate sheet of paper) must be submitted along with the manuscript.<br></p><p></p><h5><b>References</b></h5><p>19. All references and citations must be in Harvard style.<br></p><p></p><h5><b>Submission</b></h5><p>20. The soft-copy of the manuscript is to be submitted to journal@bup.edu.bd. Two hard-copies are to be submitted to the Chief Editor, BUP Journal, Bangladesh University of Professionals, Mirpur Cantonment, Dhaka - 1216.<br></p><p></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (22, N'CallForPaper', N'Call for Papers', N'Overview', N'Overview', N'<p></p><h4 align="center"><b>BUP JOURNAL (ISSN: 2219-4851)</b></h4><h4 align="center"><b>Call for Papers</b></h4><h4 align="center"><b>Volume-8, Issue-1</b></h4><br>Dear scholars and researchers,<br><br>The 1st Issue, 8th Volume of BUP Journal (ISSN: 2219-4851) will be published in the month of June 2020. The Journal will contain research based articles on development, security, education, science, technology, engineering, governance, disaster management, socio-economics, environment, medical science and other fields related to the interest of Bangladesh and/or world community.<br><br>Bangladesh University of Professionals (BUP) is committed to publish high-quality original works from academicians, scientists, engineers, business specialists, sociologists, social scientists and other scholars in aforementioned journal. We hope you will find the journal to be of international standard. It aims at creating scope for the researchers who want to enrich their knowledge through scholarly writings.<br><br>Our reviewers are selected from different universities and institutions of the country based on their excellence in corresponding academic and research field. As per the practice, all submitted manuscripts will undergo a rigorous editorial screening and peer review process.<br><br>The manuscript is to be forwarded through a covering letter containing following information:<br><p></p><ol><li>The title of article</li><li>Author or authors name (Not more than three)</li><li>Abstract</li><li>Address for correspondence with e-mail address</li><li>Personal telephone/ Cell phone number(s)</li><li>Declaration of originality duly signed by the author(s)</li><li>Declaration of the conditions that the paper is submitted to BUP Journal only and has neither been published nor under consideration for publication elsewhere<br></li></ol><p>You are requested to follow the ‘Editorial Policy’ and ‘Guide to Prepare manuscripts for BUP Journal’ which are enclosed herewith. For any assistance, please contact Captain A K M Maruf Hassan, (S), NUP, BCGMS, psc, BN (Director, Centre for Higher Studies &amp; Research), Cell Phone no.: +8801769021565.<br><br>The last date of submission of manuscript is 30 April 2020.<br><br></p><h5><b>Brigadier General Syed Mofazzel Mawla (Retd)</b></h5><p>Chief Editor, BUP Journal &amp;<br>Dean, Centre for Higher Studies and Research (CHSR)<br>Bangladesh University of Professionals (BUP)<br></p><p><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (23, N'ContactUs', N'Contact Us', N'Overview', N'Overview', N'<h4><b>Chief Editor</b></h4><h5><b>BUP Journal</b></h5>Centre for Higher Studies and Research<br>Bangladesh University of Professionals<br>Mirpur Cantonment, Dhaka - 1216.<br>Telephone: 0088-02-8000575<br>Fax: 0088-02-8000443<br>E-mail: journal@bup.edu.bd')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (24, N'EditorialBoard', N'Advisory & Editorial Board', N'Overview', N'Overview', N'<p><div align="center"><h4><u><b>Chief Patron</b></u></h4></div><div align="center"><b>Major General Ataul Hakim Sarwar Hasan, SBP, SGP, ndc, afwc, psc, PhD</b><br><b>Vice Chancellor, BUP</b></div><div align="center"><br><h5><u><b>Chief Editor</b></u></h5><b>Brigadier General Syed Mofazzel Mawla (Retd)</b><br><b>Dean, Centre for Higher Studies and Research, BUP</b><br><br><h5><u><b>Editorial Board</b></u></h5></div><p align="center"><br></p><table class="table table-bordered"><tbody><tr><td><b>Professor Dr. Tek Nath Dhakal</b><br>Head, Central Department of Public Administration<br>Tribhuvan Unversity, Nepal<br></td><td><b>Professor Dr. Nripendra P. Rana</b><br>Deputy Head Dept. of Business School of Management<br>Swansea University, UK<br></td></tr><tr><td><b>Professor Dr. Sunil Kumar Gandhi</b><br>Department of Commerce University of Kalyani, India<br></td><td><b>Professor Dr. Amit Dey</b><br>Department of International Relations<br>University of Calcutta, India<br></td></tr><tr><td><b>Professor Dr. Ruby Sain</b><br>Department of Sociology<br>Jadavpur University, Kolkata, India<br></td><td><b>Dr. Rashed Uz Zaman Professor</b><br>Department of International Relations<br>University of Dhaka<br></td></tr><tr><td><b>Dr. Mohammad Mozahidul Islam Professor</b><br>Department of History<br>Jahangirnagar University<br></td><td><b>Professor M Abul Kashem Mozumder, PhD</b><br>Pro-Vice Chancellor, BUP<br></td></tr><tr><td><b>Dr. Khondaker Mokaddem Hossain Professor</b><br>Pro-Vice Chancellor<br>Bangladesh Open University<br></td><td><b>Professor Dr. Md. Nazrul Islam Former Director</b><br>National Institute of Preventive &amp; Social Medicine (NIPSOM)<br></td></tr></tbody></table><p align="center"><u><b><br></b></u></p><h5 align="center"><u><b>Advisory Board/Associate Editors</b><b><br></b></u></h5><p align="center"><u><b><br></b></u></p><table class="table table-bordered"><tbody><tr><td><p><b>Dr. Md. Abu Zafor<br></b>Professor &amp; Chairman</p><p>Department of English<br>Jagannath University<br></p></td><td><b>Brig Gen A K M Iqbal Azim, ndc, psc, G+, PhD</b><br>Dean<br>Faculty of Arts and Social Sciences, BUP<br></td></tr><tr><td><b>Professor Dr. Syed Shahadat Hossain</b><br>Institute of Statistical Research and Training<br>University of Dhaka<br></td><td><b>Professor Dr. Mohammad Mushtuq Husain</b><p>Former Director<br>Dept. of Medical Social Science<br>Institute of Epidemiology, Disease Control &amp; Research (IEDCR)<br></p></td></tr><tr><td><b>Dr. ASM Ali Ashraf</b><br>Professor<br>Department of International Relations<br>University of Dhaka<br></td><td><b>Dr. M. Amir Hossain<br></b>Professor Institute of Statistical Research and Training<p>University of Dhaka<br></p></td></tr><tr><td><b>Professor Dr. Md. Abu Zafor</b><p>Chairman Department of English<br>Jagannath University<br></p></td><td><b>Professor Dr. M. Abu Misir</b><br>Department of Finance<br>Jagannath University<br></td></tr><tr><td><b>Professor Dr. Mohammad Thoufiqul Islam</b><br>Department of Management<br>University of Dhaka<br></td><td><b>Professor Dr. M. Anwar Hossen</b><br>Department of Sociology<br>University of Dhaka<br></td></tr><tr><td><b>Professor Dr. Md. Zakir Hossain Bhuiyan</b><br>Department of Marketing<p>University of Dhaka<br></p></td><td><b>Md. Mostafizur Rahman<br></b>Assistant Professor<p>Department of Disaster &amp; Human Security Management, BUP<br></p></td></tr><tr><td><b>Dr. Shamsunnahar Khanam</b><br>Associate Professor &amp; Chairman<br>Department of Environmental Science, BUP<br></td><td><b>Dr. Mohammad Rabiul Basher Rubel</b><br>Associate Professor<br>Dept of Management Studies, BUP<br></td></tr><tr><td><b>Dr. Md. Mohoshin Reza</b><br>Associate Professor, Department of English, BUP<br></td><td><b>Dr. Md. Elias Hossain</b><br>Professor<br>Dept. of Economics<br>University of Rajshahi<br></td></tr></tbody></table><div align="center"><br></div><div align="center"><h5><u><b>Assistant Editor/Editorial Assistant</b></u></h5></div><p align="center"><u><b><br></b></u></p><table class="table table-bordered"><tbody><tr><td><b>A K M Maruf Hassan, (S), NUP, BCGMS, psc, BN</b><br>Director<br>Centre for Higher Studies and Research, BUP<br></td><td><p><b>Tahsina Khan<br></b>Deputy Director (Research)<br>Centre for Higher Studies and Research Bangladesh University of Professionals<br></p></td></tr><tr><td><p><b>Ahmed Raihan Sadat<br></b>Assistant Professor<br>Department of Business Administration in Finance &amp; Banking, BUP<br></p></td><td><p><b>Md. Robayt Khondoker<br></b>Assistant Professor<br>Department of International Relations, BUP<br></p></td></tr><tr><td><b>Shanto Rahman<br></b>Lecturer<p>Department of Information and Communication Technology, BUP<br></p></td><td><b>Ratan Ghosh<br></b>Lecturer<p>Department of Business Administration in Accounting &amp; Information System, BUP<br></p></td></tr></tbody></table></p><p align="center"><br><b></b></p><h5 align="center"><u><b>Member Secretary/Publication/Section Officer</b></u></h5><div align="center"><br></div><p><br><table class="table table-bordered"><tbody><tr><td><p><b>Maj Md Matiur Rahman, G, Arty</b><br>Coord to Dean<br>Centre for Higher Studies and Research<br>BUP</p></td><td><p><b>Muhammad Shafiuddin</b><br>Research Officer<br>Centre for Higher Studies and Research <br>BUP</p></td></tr></tbody></table><p align="center"><br></p><h4 align="center"><br></h4><h4 align="center"><u><b><br></b></u></h4><p></p></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (25, N'ComplaintPolicy', N'Complaints Policy', N'EditorialPolicies', N'Editorial Policies', N'Complaints Policy<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (26, N'ConflictsOfInterest', N'Conflicts of Interest', N'EditorialPolicies', N'Editorial Policies', N'Conflicts of Interest<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (27, N'CorrectionPolicy', N'Correction and Retraction Policy', N'EditorialPolicies', N'Editorial Policies', N'Correction and Retraction Policy<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (28, N'EditorialIndependence', N'Editorial Independence', N'EditorialPolicies', N'Editorial Policies', N'Editorial Independence<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (29, N'EditorReviewerGuideline', N'Guidelines for Editor/Reviewer', N'EditorialPolicies', N'Editorial Policies', N'Guidelines for Editor/Reviewer<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (30, N'MisconductPolicy', N'Research Misconduct Policies', N'EditorialPolicies', N'Editorial Policies', N'Research Misconduct Policies<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (31, N'PeerReview', N'Peer Review', N'EditorialPolicies', N'Editorial Policies', N'Peer Review<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (32, N'PlagiarismStatement', N'Plagiarism Statement', N'EditorialPolicies', N'Editorial Policies', N'Plagiarism Statement<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (34, N'ArticlePromotion', N'Article Promotion', N'Authors', N'About Us', N'<p><h5><b>E-mail notifications</b></h5>Articles published in BUP journals are promoted through e-mail content alerts to our subscribers, as well as in social media.<br></p><p></p><h5><b>Search Engine Optimization</b></h5><p>Optimizing your article for search engines helps to ensure it appears higher in the results returned by search engines. This helps you attract more readers, gain higher visibility in the academic community and potentially increase citations.<br>Use keywords, especially in the title and abstract.<br>Add captions with keywords to all photographs, images, graphs and tables.<br>Add titles or subheadings (with keywords) to the different sections of your article.<br>Keyword search option at our web site will help you find like-minded scholars (choose an author in the ‘Authors’ section and check relevant keywords).<br></p><p></p><h5><b>Conferences and social media</b></h5><p>Presenting and networking at conferences can create new opportunities for collaboration. Make sure you connect with other delegates on Facebook and LinkedIn, and direct them to your website or blog.<br>LinkedIn (link of LinkedIn home page) is a professional network used by the majority of the researchers. Create a profile and post your latest accomplishments, don’t forget to reposition the publication section to a more prominent position at the top of your profile. Using social media sharing buttons from our web site will be a convenient way of informing your contacts about a new publication.<br></p><p></p><h5><b>Personal website</b></h5><p>Personal professional website will aid in highlighting your research findings, achievements, publications and ambitions. Always include links to your articles, and link to your website in your e-mail signature, and on all of your online and social media profiles, to get maximum exposure. You can also add links to your academic social networks, Facebook, LinkedIn, Twitter and other accounts.<br></p><p></p><h5><b>Google Scholar</b></h5><p>Add articles to your Google Scholar (link of Google Scholar home page) for other scholars and readers to easily find and download them.<br>Make use of your institution’s communications channels<br><br>If you’re affiliated with a particular institution, it is possible that it sends out press releases to local media and publishes internal newsletters. Increasingly, institutions also have their own press office and PR/media staff. Get in touch with them to see what they can do to help you promote your published paper.<br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (35, N'PublicationsNewAuthor', N'Publications from New Authors', N'Authors', N'About Us', N'Publications from New Authors<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (36, N'AboutUs', N'About Us', N'AboutUs', N'About Us', N'<p>Centre for Higher Studies and Research (CHSR) is mainly conducting MPhil &amp; PhD programs. Besides running these programs, the Centre is involved in various research and project works. These project works are undertaken by our researchers. With this motto, CHSR started its journey in the year 2011. The Centre had its humble beginning under HEQEP. Faculty of General Study (Now Faculty of Arts and Social Sciences) was assigned with the responsibility of running the programs initially. It continued till 2013. A separate office named Office of the Higher Studies and Research was established in the year 2013 to carry out the responsibility of running these programs. Subsequently in the year 2015 (November) it turned into Centre named as CHSR. The Centre for Higher Studies and Research (CHSR) of BUP was established with a view to creating the home ground of intellectual seekers. Presently, a good number of professionals and academicians from diversified background are undergoing these programs. CHSR is also directly involved in coordinating research works being carried out under Bangabandhu Sheikh Mujib Chair which was established on 26 December 2017.<br></p><p>BUP Journal (BUPJ) introduced by Bangladesh University of Professionals (BUP) is committed to publishing high quality articles of faculty members and researchers of public and private universities, institutes and organizations both in home and abroad. BUPJ is a peer reviewed journal and its reviewers are scholars of different esteemed universities and institutes both in home and abroad. BUPJ has print (2219-4851) version for researchers. BUPJ has a long history of publishing journal in print since September 2012. It has published 15 issues in printed version.<br>BUPJ is a scholarly journal published from Centre for Higher Studies and Research (CHSR). In the year 2019, CHSR has decided to publish Online Issues in a year and the combining two issues, each volume will be published in printed form. The online papers will be published as an Open Access initiative and will be indexed in multiple international academic databases.<br></p><p>Research is an enduring field with persistent and focused efforts leading to creating positive consequences. When research is conducted in multi-disciplinary fields of Sciences, Social Sciences, Humanities, Business or in the domain like Information Technology (IT), it has many fold impacts and implications not only for the industry, for the academia as well. Fostering research and creating a platform to publish quality research papers, based on empirical or scholarly research works, have been a continuous endeavour of the BUP Journal. In continuation to this endeavour, we are now happy to announce that the BUP Journal will soon be registered to enter into the era of E-ISSN.<br></p><p>BUP Journal contains research based articles on development, security, education, science, technology, engineering, governance, disaster management, socio-economics, environment, medical science and other fields related to the interest of Bangladesh and/or world community.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (37, N'Advertising', N'Advertising', N'AboutUs', N'About Us', N'<p>BUP Journal will consider advertising and sponsorship opportunities, as a means to provide value to our readers. We allow advertisement placement at our website and in journals.<br><br>The following policies apply to website and both print and electronic versions of journal publications:<br></p><ul><li>Advertising doesn’t influence editorial content in any way;</li><li>Published ads do not imply or indicate that advertised content is endorsed or supported by the publisher;</li><li>All advertising must be an accurate description of the product or service;</li><li>The journal’s editorial team has full and final authority for approving all advertisements and declining ads that are inconsistent with journal policies;</li><li>Advertising in all journal publications should be provided in form that doesn’t resemble editorial content and can be easily distinguishable from it;</li><li>The full rules for any market research or promotion associated with an advertisement must be displayed in the ad or available via a prominent link.<br></li></ul><p>All applications according advertisement and terms of placement are accepted on e-mail journal@bup.edu.bd specifying “Advertising” in letter subject.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (38, N'ContactInformation', N'Contact Information', N'AboutUs', N'About Us', N'<h5><b>Postal address:</b></h5>Chief Editor<br>BUP Journal<br>Centre for Higher Studies and Research Bangladesh University of Professionals Mirpur Cantonment, Dhaka - 1216.<br>Telephone: 0088-02-8000575 Fax: 0088-02-8000443<br>E-mail: journal@bup.edu.bd<br>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (39, N'CurrentIssue', N'Current Issue', N'AboutUs', N'About Us', N'Current Issue<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (40, N'ManuscriptSystem', N'Manuscript Administration System', N'AboutUs', N'About Us', N'<p></p><p></p><p></p>The "Manuscript Administration System" is the web application for academic journals, which is developed with the purpose to automate and manage the processes of manuscripts submission, revision, reviewing, etc. The system has been developed and you don’t need to install any software. You just work with the system online.<br>Note on compatibility: The web application works best in the latest version of your browser. Supported Browsers and Operating systems are the latest versions of Chrome Windows 7–10; the latest versions of Firefox Windows 7–10, Internet Explorer 11 Windows 7, Microsoft Edge 17 Windows 10; and the latest versions of Safari Mac OS.<br>The Manuscript Administration System page is available to support all user groups. The System users are Managing Editor-in-Chief, Editors, Editorial Board Members, Authors, Reviewers and Publisher Representatives.<br>If you have any questions about this Manuscript Administration System, please contact us: journal@bup.edu.bd<br><p></p><h5><b>FAQ</b></h5><ul><li>Any user can register to the system using the following option: Standard registration form</li><li>Any registered user except for the Publisher’s Office role can log in to the system using the following option: Email as a username and a password</li><li>Any registered user, except for Publisher’s Office role, can change a password using Forgot password function.</li><li>Any registered and logged in user can log out of the system.</li><li>Any user having more than one role in the system can switch the roles when using the system interface and roles will be activated by managerial administrator.</li><li>Any registered and logged in user except for Publisher’s Office role can edit data in his/her own profile by clicking My profile menu item.Any registered and logged in user except for Publisher’s Office role can view the service pages:<ul><li>Privacy policy</li><li>Contacts</li><li>About the system</li><li>FAQ</li></ul></li></ul><p></p><ul></ul><p></p><p></p><ul></ul><h4><b>The ROLE''s in Manuscript Administration System</b></h4><h5><b>Managing Editor Role:</b></h5><p>Manages the processes of the manuscript review and editing, following the manuscript schedule; checks the manuscripts at the initial stage, supports the peer review process managing; assists authors and Editors, arranges the final documents for publishing and has regular control over the deadlines;<br>As a Managing Editor, the user can view the following menu items after login is done:</p><ul><li>My Profile</li><li>Roles switcher</li><li>Logout option</li><li>Submissions</li><li>External Reviewers Invitations</li><li>Privacy Policy</li><li>Contacts</li><li>About the system</li><li>FAQ<br></li></ul><p></p><h5><b>Submissions</b></h5><ul><li>As a Managing Editor, the user can view all the submissions created in the system within a journal(s) they are assigned to.</li><li>As a Managing Editor, the user can filter all the submissions created in the system within a journal(s) they are assigned to, by applying parameters such as:<ul><li>Phase</li><li>Status</li><li>Submission ID (within journals available for the role)</li><li>Submission creation date</li><li>Journal – only those journals they are assigned to</li><li>Author &amp; co-authors – only those authors and co-authors, who submitted manuscripts to their journals</li><li>Manuscript Title (within journals available for the role)<br></li></ul></li><li>As a Managing Editor, the user can apply quick filters to submissions such as:<ul><li>Overdue</li><li>New<br></li></ul></li><li>As a Managing Editor, the user can apply cross-search functionality to search for the manuscripts throughout the system.</li><li>If any submission is found, the user with Managing Editor Role can open submission details only if such manuscript was submitted to the journal available for the Managing Editor.</li><li>As a Managing Editor, the user can sort the enlisted submissions by all the columns except for the ‘Author’ column.</li><li>As a Managing Editor, the user can apply a paginator and number of the submissions to be displayed on one page.</li><li>As a Managing Editor, the user can view a submission card by clicking on a submission from a submission list.</li><li>As a Managing Editor, the user can view all the elements comprising a submission form.</li><li>As a Managing Editor, the user can perform actions on submission, i.e:<br><ul><li>Upload files allowed on a definite submission workflow step</li><li>Write a comment to the author of a manuscript</li><li>Reject submission</li><li>Send submission to the author for revision</li><li>Transfer submission to the next step of the workflow</li><li>Edit email templates before sending them during submission workflow</li><li>View emails list per submission</li><li>View the details of one email or email threads</li><li>Create a new email from the Emails tab</li><li>Reply to the incoming email (email comes to the email box of the user outside the system and is reflected in the Emails tab of a submission)</li><li>View the history of files attached to the manuscript and download any of the files attached</li><li>View the activity log of the submission</li></ul></li></ul><p></p><ul></ul><p></p><p></p><p></p><ul></ul><p></p><p></p><ul></ul><p></p><p></p><h5><b>External Reviewers:</b></h5><p></p><ul><li>As a Managing Editor, the user can view the list of the external reviewers invited</li><li>As a Managing Editor, the user can sort the enlisted users by all the columns</li><li>As a Managing Editor, the user can filter the list of users by applying the following parameters:<ul><li>Journal (available to such Managing Editor)</li><li> User First and Last name</li></ul></li><li>As a Managing Editor, the user can invite external reviewers to become independent reviewers of a particular journal.<br></li></ul><p></p><h5><b>Author Role:</b></h5><ul><li>The person who has submitted the article for consideration;</li><li>As an Author, the user can view the following menu items after login is done:<ul><li>My Profile</li><li>Roles switcher</li><li>Logout option</li><li>Submissions</li><li>Privacy Policy</li><li>Contacts</li><li>About the system</li><li>FAQ<br></li></ul></li></ul><h5><b>Submissions</b> <br></h5><p></p><ul><li>As an Author, the user can view all the submissions ever created by him in the system.</li><li>As an Author, the user can sort the enlisted submissions by all the columns.</li><li>As an Author, the user can apply a paginator and number of the submissions to be displayed on one page.</li><li>As an Author, the user can view a submission card by clicking on a submission from a submission list. The elements of the submission card should be different from the one visible for the Managing Editor.</li><li>As an Author, the user can submit a new manuscript in the system:<br><ul><li>State the data about him/herself,</li><li>State the data about co-authors,</li><li>Attach manuscript,</li><li>Attach cover letter,</li><li>Attach declaration of originality.</li></ul></li><li>As an Author, the user can read and write comments to a Managing Editor in the submission form.</li><li>As an Author, the user can attach permission file during Initial Review and Plagiarism Check Phases.</li><li>As an Author, the user can view a current status of the submission.<br></li></ul><h5><b>Editorial Board Member Role:</b></h5><ul><li>As an Editorial Board Member, the user can view the following menu items after login is done:<ul><li>My Profile,</li><li>Roles switcher,</li><li>Logout option,</li><li>Submissions,</li><li>Privacy Policy,</li><li>Contacts,</li><li>About the system,</li><li>FAQ</li></ul></li></ul><p></p><ul></ul><p></p><h5><b>Submissions</b></h5><ul><li>As an Editorial Board Member, the user can view all the submissions assigned to him/her for the double-blind peer review process.</li><li>As an Editorial Board Member, the user can sort the enlisted submissions by all the columns except for the ‘Author’ column.</li><li>As an Editorial Board Member, the user can applya paginator and number of the submissions to be displayed on one page.</li><li>As an Editorial Board Member, the user can view a submission card if the submission is assigned to him/her for a double-blind peer review process by clicking on a submission from a submission list.</li><li>As an Editorial Board Member, the user can view a limited number of data on a submission form. The user cannot see the following information:<ul><li>Author and co-authors,</li><li>Attached cover letter,</li><li>Attached permission doc,</li><li>Attached referee reports from other reviewers, assigned by Managing Editor,</li><li>Comments,</li><li>Files and Log tabs.</li></ul></li><li>As an Editorial Board Member, the user can perform actions on submission, i.e:<ul><li>Download a manuscript document</li><li>Upload referee report during double-blind peer review phase,</li><li>Invite external reviewers to review the submission if such option is allowed by a Managing Editor role on a double-blind peer review phase,</li><li>View the list of invited external reviewers and their referee reports.<br></li></ul></li></ul><p></p><h5><b>Editor Role</b></h5><ul><li>As an Editor, the user can view the following menu items after login is done:<ul><li>My Profile,</li><li>Roles switcher,</li><li>Logout option,</li><li>Submissions,</li><li>Privacy Policy,</li><li>Contacts,</li><li>About the system,</li><li>FAQ<br></li></ul></li></ul><p></p><h5><b>Submissions</b></h5><ul><li>As an Editor, the user can view all the submissions created in the system within a journal(s) they are assigned to.</li><li>As an Editor, the user can filter all the submissions created in the system within a journal(s) they are assigned to, by applying parameters such as:<ul><li>Phase,</li><li>Status,</li><li>Submission ID (within journals available for the role),</li><li>Submission creation date,</li><li>Journal – only those journals they are assigned to,</li><li>Author &amp; co-authors – only those authors and co-authors, who submitted manuscripts to their journals,</li><li>Manuscript Title (within journals available for the role).</li><li>As an Editor, the user can apply quick filters to submissions such as:<ul><li>Overdue,</li><li>New</li></ul></li></ul></li><li>As an Editor, the user can apply cross-search functionality to search for the manuscripts throughout the system.</li><li>If any submission is found, the user with an Editor Role can open submission details only if such manuscript was submitted to the journal available for the Editor.</li><li>As an Editor, the user can sort the enlisted submissions by all the columns except for the ‘Author’ column.</li><li>As an Editor, the user can apply a paginator and number of the submissions to be displayed on one page.</li><li>As an Editor, the user can view a submission card by clicking on a submission from a submission list.</li><li>As an Editor, the user can view all the elements comprising a submission form.</li><li>As an Editor, the user can perform actions on submission, i.e:<ul><li>View emails list per submission,</li><li>View the details of one email or email threads.</li><li>View the history of files attached to the manuscript and download any of the files attached.</li></ul></li></ul><blockquote class="blockquote"><p>If you have any questions about this Manuscript Administration System, please contact us: journal@bup.edu.bd<br></p></blockquote><p></p><ul></ul><p></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (41, N'OurTeam', N'Our Team', N'AboutUs', N'About Us', N'<p></p><p></p><h5><b>Site Administrator</b></h5><p>Information &amp; Communication Technology Centre<br>Bangladesh University of Professionals<br><br></p><h5><b>Publisher Coordinator</b></h5><p>Muhammad Shafiuddin<br>Research Officer<br>Centre for Higher Studies and Research<br>Bangladesh University of Professionals<br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (42, N'Partnership', N'Cooperation and Partnership', N'AboutUs', N'About Us', N'<p></p><h5><b>Cooperation</b></h5>We are always open for cooperation with booksellers, subscription agencies, universities, and other entities. For any propositions, please e-mail to journal@bup.edu.bd.<br>We consider proposals from booksellers concerning the possibility of distributing books, monographs and other publications. All terms of cooperation with subscription agencies concerning journals’ subscription, books and monographs purchase, discount or commission, information layout in databases are discussed individually. Also, we invite universities to cooperate on journals publishing and its management. We are open towards scientific societies and individual researches propositions concerning publication of monographs, study guides, books, and articles subject collections, necessary for university course of lectures.<br><br><h5><b>Our Partners</b></h5>All proposals and enquiries regarding partnership should be sent to journal@bup.edu.bd indicating “Partnership offer”.<br><br><p></p><table class="table table-bordered"><tbody><tr><td><p><img style="width: 251px;" src="data:image/jpeg;base64,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" data-filename="DOJ.jpg"><br></p></td><td><h5><b>DOAJ</b></h5><br>On November 01, 2020, "BUP Journal" was admitted as a member of the Directory of Open Access Journals (DOAJ).<br><br>Website: <a href="https://doaj.org" target="_blank">https://doaj.org</a><br></td></tr><tr><td><p><img style="width: 262px;" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEA3ADcAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCACDAQYDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9U6KKKACiiigAooooAKKKKACiikoAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikzQAtFFFABSGikLdqAFozUM08duheV1jUfxMcCuW1b4maNpmUjla9lH8NvyP++ulebi8xwmBjzYmqorzZvSoVaz5acWzrSwFKp9q8nk+KuoahqVrDbW8VrA8yId3zMQWAPNerr1rjyvOsJnHtHhHdQsm7GuJwlbCcqqqzY+iiiveOMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApOKKwfG3i2y8CeF9R1/UllNjYRebL5K7n25A4Gfepb5VdlwjKpJRirtm7nAqOadIY2eR1RV6sxwBXhNr+0xp/jJQvh27tBu6LI2Zv++Tj+VZuoa1faw5N5dy3A9Gb5efavzLNuO8Hl8nTpU5Tl6WX46n09Lh3F3tXXJ67nsOrfErRdL3KtwbuUfwQDPPuelcXq3xa1G6JWygjtE5wz/O+P5A1w2O1Ltr8qzHjrNsdeNOXs4/3d/vPocPkeFo6yXM/MtX+q3mqsTeXUtwfR24/LpVTilozXwVavVryc6snJ+Z7sKcKatBWLGljGq2X/XeP/0IV9Hr/SvnHTf+QpZf9fEf/oQr6OU1+8+Gn+7Yj1X5Hw3Ef8an6MWgms7xB4i0zwrpFzqmsX9vpunW67pbm5kCIg9yf5d6+b/E3/BQr4aaPNPBpdvq+vSRvtWaC3EUEg9Vdjn81FftJ8fdI+oQaWvnHwR+3j8L/F2owWF1dX3h25mAAk1SALBuJwF8xSefcgD3r6ItriK6hjmglSaGRQ8ckbBldSMggjqCKQXRNRRRQMKKKSgBaKKKACiiigAopKWgAooooAKKKKACiikNABmiuH+J3xo8HfB+xgufFesw6abjPkW+C802Ou1FBOPc4HvXNfCP9qPwP8atfn0bw5Jf/b4YTcMl5a+UCgIBIOT3IoFc9eooooGJ/Ea8x/aY/wCSE+Mv+vI/+hLXp3v2rzH9pj/khPjL/ryP/oS1lU+CXoejlv8AvtH/ABR/NH5jrlSGBKt6qcGu18O/GDxV4bIWLUWvYAf9TeDzB0xgH7wHsDXFjoKRmC8kgV+b18LQxUeWtBNH9t18Lh8RHlrxTXmfQnh39pSwuNketafLZN0M9ufMT6kdR9BmvT9B8Z6J4nj36ZqcF0cAlFfDrn1U8ivlfwv8LfFXjLa2maNcNASV+03A8mIEdRuavXfCf7KjQyR3Gu640bqdwh0wbWHH/PQ9D9Aa+VxPBWHxb5sPeD/A/LM7p5DgU2sRyy/lXvHsta2leE9X1rBtbKQxn/lpINq/metWPCNvF4Lt4YLKIXCRAAPfEzyH1O885P8AkV6NpvxJtZMLeWz2x7tH86/40Zf4d0782Nr6dor9T8fxWfSTccPHTu/8jH0L4SyQ3ENxf3uGjdXEUI7g5HJ/wr0oZ+lVNP1iy1Rd1rcxzeqqeRxnpRrVw9no1/PGN7x28jqvqQpIFfrmVZPg8npung42T363PksTi62KlzVndn5l/tk/HS/+K/xMvNAsppT4Z0O5a0trVD8tzcKdrykD7x3ZVevHT7xr2H4Qf8E8dP1Hwzaan471bUIdTuo1lGm6cVjFuCM7XZlJZumcYx05r5W+BdhB4g+Ofga01CIXlvd63AJ45MkOC+Tn8RX7Er39K956HnR97Vn5x/tQfsWL8IPDL+KvCt/c6roVuyrfWt7tae3DEBXUqAHXcQCMZGR15x6F/wAE8Pi5f3VrrngLVZJ5bTT4DqWnyyg4hj3gSR5PbLBgO3zetfa09vHcxNFNGssbdUdQwP1BrPutJsrLT7yS3s7e3kMDgtFEqH7p7gUrlctndHE+Gf2kPhz4w8Q2+haP4ntr3VbhmSO2RHBYqCT1XHY1T1D9qP4Y6d40g8KP4phn1ua4jtEhtYZZ0852CqhkRSgOSAcnjvX5YaJd6ta+MmTQGkTV7yeSyt2hJD7pWKYUjoTnGfQmvsfwH+wQnw9XSfGPibxobe60OWPVrq0s7MSQqsJErLvLAnhSCQPpRYSk2fXPjr4leGPhnpJ1HxPrVro9rzs+0Ph5SBnaiD5nOB0UE15dD+2/8GZ5oo18WspkcIC+nXKqCfUmPAHua+E1utf/AGvf2hLa2u7028mr3LiFXk3pY2iBnKxg4ztRSe24+5r6q8Sf8E5/A7eHbpdC1bWrfXBETbzXdykkLSAZAZNo4J468Z70WDmb2PqnQPEWl+KdLh1LR9RttU0+YZjurSVZI3+jA4rnPiR8YvB3wlskuvFWvW2lCQZihbLzyjIBKRKCzAZGcDivzz/Y3+Kmp/Cn4z2vhq8uDHourXTabe2ryHyo7gMVSQD13jbnuG9hXH/tOa1fa9+0X4wfxA9wUtdUazRQMMlojYTYD6pyPXOe9HKHNofeg/bm+DW8g+KJtvGG/s25wf8AyHmvYvCvjDRfHGjw6roGqWur6dLwtxaSh1z3Bx0I7g8ivkSH4I/s3/FnwHPY+B9XsdM8QR2qyRXz37rdJJjC+dHI2OT94ADrxiui/ZJ/Zv8AiD8CfF97c6rqumXHhvUrTE9tZzO2ZgQY3UEY6bgT6Yo0Gmz3T4k/HTwL8IzGvirxDbadcSAMlqoaWcqScN5aAtt4POMVwcP7cXwbmmWP/hKZI9zBQ76dcBTn32cD3Nfnf4w1k+J/jjqV/wCPTdwxTa2V1dIMmaGBZdrogOcFUHA7dhX1p4m/Z9+Avxe8C3I+GGr6RpfiO3VXt5k1FvmkI4jnSRicH2AIP5UWFzNs+vrDxdo2qeGz4gstTtr7RRC1x9utZBJEY1BLMCuc4AP5Vx3gv9on4d/ELWotJ8PeJrbUtQljaVIY0cEqoyxyQBwK8Q+BPwF8d/AfwH8RrDxBqdhdaBfaRPNb21nIzeXcCJwzYI4BXGcdSK+Dvh1b69qeuWekeGPMOr6zH/ZqLE21nWTAYbuwIB3H+7miw3Jo/VO0/ak+GWoeOLfwjZeKIb7W7i4W1ijtYJZYnkPRRKqlPY/NxXW+Pvid4X+F2k/2l4p1q10i1IOwTNmSUgZIRBlnPsoJr5b+HP7C8Pwh1TSPHOs+MzNd+H2/tGe0trNRbt5YLFQ7NuxgdcV812V5qf7XHx+iPiDWYtHt79nk8ydwsdlZpyI4wxxuxjvySTRYOZrc+7LL9tz4N315Dbr4rMTSuqK89hcRoCT1ZimFHucAV6jrnxE8NeH/AAf/AMJVfa1ax+HdqONSR98JV2CqQy5yCSBx618f/Eb9iP4ZWngnVbjwh4tmbxFBC01vFe6pDNHOygnytoC4LYwDng4ryv8AZL1KL4jy6t8FPFN3fHwr4gj+028VrKEktrmBxMdjEHarBDuGDkgYxk5Ldg5nszi/2qviDH8Tfjl4g1Wx1FNS0iPyrXTriMHZ5IjUnH/A2f619o/speFfgxpuoLc+ANQbUfFMOmIuoytPKxKsRuJVvlHzDHyjtXwj8cvAem/DX4xeJvCukvcSaZpt1HDA11IHlKtFG53MAMnLntX6N/s8/sz+E/gvnX9AuNWmvdWsIUnW/uVljA4f5QEGOSe9N7ExvdntvNFLz6UVBqFcH8dPDd/4u+EviXR9Lg+06heWvlww5A3tuHGTXd96aRUtcyaZtRqyoVY1Ybxaa+R+f/h/9knUIZFbxVqX2A4/49bNNzHB6b24Ix6DivWfC/wf8I+Edr2Wjwy3A/5eLz99J+bcfpX1HcW0F5EY54kmQjBWRQRivOvG0ngfw1E8mo6tDpMuNwijk3sfpHyT+Arz6eXJO1NXZ9LmnGGY41N4uvyx7J2RynpnsOPYUdenNeRfEL48Po8Ui+EdIPiGQEgTXUgt1B7ME6sPxU+1fL3j/wCPPxG8Ryy22p6hcaLbSBgbOyQ26lSMEE/eYfUmuyWBr0/jjY+Lp5phcQ37KopP1PtPxh8VPCfgNW/tvXbSzmXg24ffNn02Lkg/XFeG+Mf22LKHfB4V0GS8OcC71N/LTGOcRrzkHHU4r5OY+Y29yXcjlmOWP40tVHDxj8RrKtJ7Hrmk/HTxz45+IvhWPUtemjtZNZsQ1rYjyIiPtEY6LzyOvPNfrJNGJY2RvusCv5jFfi/8Of8Ako/hD/sNWP8A6UR1+0netmrbBFt7n49+OPD+rfAL423drGstve6DqYurKRhgyQht8Tg4x8yd+gOR2r9T/hP8WvD3xh8K2utaDfRT+ZGpuLTePOtnxyjr1HOeeh6iuL/aO/Zh0T4/aZDM8/8AZPiSzQpaamibgVPPlyr/ABJnnqCOcd6+IdW/Yh+Mug6nPa2GipqUIwftmm6nHFHL/wB9ujce4o3FrFn2H+2N8eLT4WfDW+0zS9YW38Y6ltgs4baQGe3UkF5mH8IC8AnqWGM814h+xH4s+IHxI8XeJNQ1/wAT6vq2g6VpjqY7qfMTXEnCgjHPyhz7YFeeeDf2D/ip4p1gRa9bweG7QbfMvr67S5dl9EWNmJI9GKj3r75+GHwh0T4PfD1fDHh6JjHsdpbibBluZmXBkc+p49gABRoh6t3PzM/Zz/5Ob8Df9h0/+gyV+pnxI0m5134d+KtMs4zLd3mlXVvDGP4neFlUfiSK+F/gz+yL8TvCHxx8LeI9U0WCDSbHVTdTzLeRMVjw4ztDZP3hxX6F4zQxxWmp+Uf7GeuWXhf9ozwnNqM8Vtbubiz82U8CR4XRAD2y5C/jX6p6hqNtpNhcXt5KttaW0bSyzSHCoqjJJ/AV8a/tKfsLX3ijxHqPiz4f3Ful1eSNc3WjXD+UGlOWZoX6AscfK2ACSdw6V5Tf/AL9p7xPpseh6u2tXOjyFI2tr3XoXt0UYxuUSk4GB0BPFGjErxPMfh7ZyfEb9pHRzpaqRfeJlvYj/D5SXHnE/wDfCE/jX198Wrj9nr47fEBND1i/msvG7XP9lrdWkbwSmbOxY5DjawB6bq6j9ln9kOD4HTP4g1u8h1XxZNEYVNuD9ntEJ+ZYyQCxOBliB0xivP8A9pj9h/VvF/jDUfGXgK6t1vL1zdXelXEhiZp+peGTpljg4bGDk7uwd1cEmlc434of8E59Q0LSbnUvC3iWLWIrSAzNZ6tAI5XI5ba6/KPlHAI696539hv42eJdL+Kml+EZtSu9T8O6wsifZLiQyi3kCFlkQnJUYXBA45FbmreBv2t/EHhr/hHr/wDtCXTZF8uRjqVossinqHlEm5hjqCea9i/ZQ/Y5uPgzrMnirxRe2t74h8poLW1syWhtUbG5ixA3OQMdMDnGc5ouK2t0c74w0n9nb9pzx8LCy1Sew8bX7SRLd6ejQmaRFOS4YbHYBD1615f8af2BdU+Hfh3VPEug+IYda03TIftLwX0QhuVVVLOwcfKSMcAAH3rr/jh+wt4jsvGN14s+F95Coa4N7HpYm+zT2s24MPIf7uN2SNxXGOprn/Enw5/ax8faJH4d1xbp9IlAhmDahaIJEPB84o+517nOaQ36GT+yX8bPEt1H4t8C6nqFzq2jXPh6/urb7XIZGtXjiJIVjztYN0J6iuB/YojWT9ozwTuG7b5zDPY/ZpOa+ufgL+yBP8H/AAb4qu9QvbfVvGGsaXPYotvkQW6sjAIjMASWJGWIHpivKP2YP2T/AIlfDX4zeGdf1/RoLXS7IS+dKl5FIV3Quo4ByeSKegrPQ+0/ilos3iL4b+KdKtzi4vNNuIY/94xkCvye+B/w50f4rfE3SfCmv6tJoNrfLIi3CRqzmcDKR4cEZJyOfSv2K29a+KP2jP2FdQ8QeJr7xZ8O57eGe6drm50aZ/J/e9S8DjgFjztbAySc9qSZUlfUdcf8EzfB1rbyzz+ONVggiQvJLJa2qqigZJJK4AA9apfs5fBv4P6X8YNF1Hwf8V7zxPrlh5ssemi1VVddjKxZhGMAA+vp6157d/AP9p/xdZpoetXGtS6PclYpYtQ16J7dVyBl1EhJUewPTpX1T+y3+y3Z/AHS7m+vriHVPFeoRrHcXkS4jt4+D5MRPO3IBJONxA4GKBJeR8Kftaf8nM+O/wDr/h/9J4a/VPwp/wAivo3/AF5w/wDoAr4Z+Pv7HvxH+IXxr8U+JtHtLCTS9Qu45YHku1Riqwxocjtypr7r0G1ksdD022lAEsFtHE4HI3BAD+opMcVZs0KKKKRY3tXO/ELxJN4Q8F6trNvEk81nAZEjkJCscjr+ddFiuG+OH/JJ/Ev/AF6n+YrWkk6kU+5y4qThQnKO6T/I+UPE/wAcvGfizctxq8ljbtg+Rp48lRj/AGgd364rhGLSSM7sXdjks3JP401egpa/SKdGnSVoRsfzvXxdfEyvWm36ibajubOG9iMVxDHPGf4ZFDD8jUtGR+uK0lFSVmjmjOUJXi7M4rV/hNouobnthJp8p7wnKZz1Kn+hFcTq3wm1rTwzWhj1KMZ4jO18f7p6n6V7zouhal4kuBb6XYXGoSk7dtvGXwcZwT0HHqa9X8K/ss+KtaKSarLb6JbsASjnzJSO4wOAfxrw8VQwMfjfK/I+2yrHZ1JqNBOa89vvPiHwHZ3Gn/EzwlFdQSW0q63YgrKpU5+0R8c1+zoPzGvIvCf7MPgzQZLW5v7Ztev7dlkjnvsFY5Fbcrog4UggflXrqrg5zmvka3s+b927o/WMI67pp4iKUuy1FPNJjFOpMZrA7Q20m2nUUAN20q8UtFACEZpNtOooAQUhGc06igBopaAMUtADduaNtOooAbto206igApu2nUUAJiloooAbtpcUtFABRRRQAgrhfjh/wAkm8S/9eh/mK7qsDx54Zbxl4Q1PRVn+yteReUJiu7ZyOcd60pyUZxb7nNiYSqUJwju0/yPz4/hHpiruk6PqGvXH2fTbG4v5v7lvEzke5wOlfWXhP8AZb8KaF5cmpGfXLhcH9+2yLIOchF/kSa9Y0nRLDQ7ZLbT7OCygXpHbxhFH4Cvqq2cwjpSjc/LsHwfXqWliZqK7LVnyT4V/Zd8W68Uk1J7fQrcg584+bL7fKpxz/vfhXsnhX9mHwhoWyS+jm1u4Xkm7f5PpsGAR9c17BtpcV4dbMcRW3lZeR9thOHsvwdmocz7vUpaXo9jotqlvYWkNpCihRHCgQYAwOlWwop2KK81tvc+ijFRVkgpaKKCgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWigBBS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB/9k=" data-filename="CrossRef.jpg"><br></p></td><td><h5><b>Crossref</b></h5><br>Since November 2016, "BUP Journal" is a member of Crossref international register of scientific and information resources. In the context of cooperation, the publishing company employs Similarity Check to check the manuscripts for plagiarism, and Content Registration to assign DOI to articles.<br><br>Website: <a href="https://www.crossref.org" target="_blank">https://www.crossref.org</a><br></td></tr><tr><td><p><img style="width: 290px;" src="data:image/jpeg;base64,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" data-filename="Unicheck.jpg"><br></p></td><td><h5><b>Unicheck</b></h5><br>Cooperation agreement towards quality assurance of scientific publications was signed in November 2020.<br><br>Website: <a href="https://unicheck.com" target="_blank">https://unicheck.com</a><br></td></tr></tbody></table><p><br></p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (43, N'PublicationEthics', N'Policies and Publication Ethics', N'AboutUs', N'About Us', N'<p>In its activity, the publishing house “BUP Journal” fully adheres to the declared publishing and editorial policies, which concern all our journals.<br></p><p>We are oriented towards Principles of Transparency and Best Practice for Scholarly Publications, developed by The Committee on Publication Ethics (COPE), the Directory of Open Access Journals (DOAJ), the Open Access Scholarly Publishers Association (OASPA), and the World Association of Medical Editors (WAME) , and follow them as closely as possible.<br></p><p>We support the following initiatives and wish to develop close cooperation with such organizations as:<br></p><ul><li>Committee on Publication Ethics (COPE), Budapest Open Access Initiative.<br></li></ul><p>We understand that such a small publisher as “BUP Journal” with three journals is a drop in the ocean of academic editions. But a drop creates the streams, which unite and turn into rivers that nurture the seas and the oceans.<br></p><p>That’s why our policies are developed taking into account the modern trends in the work of the leading journals of the world and are refined on the way to the “ocean”. We understand how difficult it is for our colleagues – founders and publishers of the journals in Bangladesh – to make a way. That’s why, having analyzed the principles embedded by Committee on Publication Ethics (COPE), the experience of embedding the principles of publication ethics by Elsevier , recommendations by Cabells etc., and having studied the Bangalian specificity, we provide our colleagues with the guidance for bringing their practice closer in line with the global standards. It is realized with the help of the project Journal''s International Compliance Index (JIC Index). The mission of the project is to determine the guidelines for the promotion of academic journals into the international scientific environment on the basis of compliance with the international standards of publishing and the principles of publication ethics.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (44, N'RecentNews', N'Recent News and Releases', N'AboutUs', N'About Us', N'Recent News and Releases<br><br><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p><p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus. Rem magni quas ex numquam.</p>')
INSERT [dbo].[StaticContent] ([Id], [PageName], [PageDisplayName], [CategoryName], [CategoryDisplayName], [PageContent]) VALUES (45, N'Subscription', N'Subscription', N'AboutUs', N'About Us', N'<p>The subscription prices for print journals are presented in Order form (a link of printed invoice where details are given).<br>In case you would like to order institutional print subscription, please contact journal@bup.edu.bd.<br>At the time of the order please state<br><br>for individuals:<br></p><ul><li>journal title,</li><li>year of publishing and issue number,</li><li>last, first and middle name,</li><li>place of employment,</li><li>telephone/cell phone number,</li><li>e-mail address,</li><li>active postal address for shipping hard copies.<br></li></ul><p>All information stated by the customer is confidential and will be used only for inner policy (invoice and agreement). Within thirty days after making order the representative of the journal will contact you for sending invoice and agreement or clarifying information provided by you if needed.<br><br>All payments are processed by direct bank transfer on the account of BUP Journal, Trust Bank Ltd., Mirpur DOHS Branch. After receipt of payment on the journal’s account the Member Secretary/Focal Point/Administrative Officer of the journal will contact the subscriber for announcing the hard copies shipment terms.<br></p>')
SET IDENTITY_INSERT [dbo].[StaticContent] OFF
GO
SET IDENTITY_INSERT [dbo].[Volume] ON 

INSERT [dbo].[Volume] ([Id], [JournalId], [SortOrder], [Title]) VALUES (9, 7, 1, N'Volume - 7')
INSERT [dbo].[Volume] ([Id], [JournalId], [SortOrder], [Title]) VALUES (10, 8, 1, N'Volume - 7')
SET IDENTITY_INSERT [dbo].[Volume] OFF
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_PublishDate]  DEFAULT (getdate()) FOR [PublishDate]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_Downloads]  DEFAULT ((0)) FOR [Downloads]
GO
ALTER TABLE [dbo].[Call4Paper] ADD  CONSTRAINT [DF_Call4Paper_PublishedDate]  DEFAULT (getdate()) FOR [PublishDate]
GO
ALTER TABLE [dbo].[Call4Paper] ADD  CONSTRAINT [DF_Call4Paper_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Issue] ADD  CONSTRAINT [DF_Issue_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Issue] ADD  CONSTRAINT [DF_Issue_PublishDate]  DEFAULT (getdate()) FOR [PublishDate]
GO
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_ImageFile]  DEFAULT (N'NoImage.jpg') FOR [ImageFile]
GO
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_IssuedSince]  DEFAULT (getdate()) FOR [IssuedSince]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_PublishedDate]  DEFAULT (getdate()) FOR [PublishDate]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Volume] ADD  CONSTRAINT [DF_Volume_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Issue] FOREIGN KEY([IssueId])
REFERENCES [dbo].[Issue] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Issue]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Volume] FOREIGN KEY([VolumeId])
REFERENCES [dbo].[Volume] ([Id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Volume]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_Category]
GO
ALTER TABLE [dbo].[Volume]  WITH CHECK ADD  CONSTRAINT [FK_Volume_Journal] FOREIGN KEY([JournalId])
REFERENCES [dbo].[Journal] ([Id])
GO
ALTER TABLE [dbo].[Volume] CHECK CONSTRAINT [FK_Volume_Journal]
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_Admin_DeleteArticleById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_Admin_DeleteArticleById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Article
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_Admin_GetArticles]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_Admin_GetArticles]
AS
BEGIN
	set nocount on;
	
	SELECT
		Article.Id, Article.SortOrder, Article.Title, Article.Author, Article.DOI, Article.Keywords, Article.Details, Article.ArticleFile, Article.PublishDate,
		Issue.Id as IssueId, Issue.Title as IssueTitle,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM 
		Article inner join Issue on Article.IssueId = Issue.Id 
		inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
		inner join Category on Journal.CategoryId = Category.Id
	order by Category.SortOrder, Journal.SortOrder, Volume.SortOrder, Article.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_Admin_InsertArticle]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_Admin_InsertArticle]
(    
    @IssueId int,
	@SortOrder int,
    @Title nvarchar(250),
    @Author nvarchar(250),
    @DOI nvarchar(250),
	@Keywords nvarchar(1000),
    @Details nvarchar(max),
    @ArticleFile nvarchar(250),
    @PublishDate datetime2(7),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Article (IssueId, SortOrder, Title, Author, DOI, Keywords, Details, ArticleFile, PublishDate)
	values (@IssueId, @SortOrder, @Title, @Author, @DOI, @Keywords, @Details, @ArticleFile, @PublishDate)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_Admin_UpdateArticle]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_Admin_UpdateArticle]
(
	@Id int,
    @IssueId int,
	@SortOrder int,
    @Title nvarchar(250),
    @Author nvarchar(250),
    @DOI nvarchar(250),
	@Keywords nvarchar(1000),
    @Details nvarchar(max),
    @ArticleFile nvarchar(250),
    @PublishDate datetime2(7)
)
AS
BEGIN
	set nocount on;
	
	update Article
	set
	IssueId = @IssueId,
	SortOrder = @SortOrder,
	Title = @Title,
	Author = @Author,
	DOI = @DOI,
	Keywords = @Keywords,
	Details = @Details,
	ArticleFile = @ArticleFile,
	PublishDate = @PublishDate
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_GetArticleById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_GetArticleById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Article.Id, Article.SortOrder, Article.Title, Article.Author, Article.DOI, Article.Keywords, Article.Details, Article.ArticleFile, Article.PublishDate, Article.Views, Article.Downloads,
		Issue.Id as IssueId, Issue.Title as IssueTitle,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM Article inner join Issue on Article.IssueId = Issue.Id inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	where Article.Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_GetArticlesByIssue]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_GetArticlesByIssue]
(
	@IssueId int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Article.Id, Article.SortOrder, Article.Title, Article.Author, Article.DOI, Article.Keywords, Article.Details, Article.ArticleFile, Article.PublishDate, Article.Views, Article.Downloads,
		Issue.Id as IssueId, Issue.Title as IssueTitle,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM 
		Article inner join Issue on Article.IssueId = Issue.Id 
		inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	where Article.IssueId = @IssueId
	order by Article.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_GetPartialArticles]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_GetPartialArticles]
AS
BEGIN
	set nocount on;
	
	SELECT top(5)
		Article.Id, Article.SortOrder, Article.Title, Article.Author, Article.DOI, Article.Keywords, Article.Details, Article.ArticleFile, Article.PublishDate, Article.Views, Article.Downloads,
		Issue.Id as IssueId, Issue.Title as IssueTitle,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM
		Article inner join Issue on Article.IssueId = Issue.Id 
		inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	order by Article.Views desc, Article.Downloads desc, Article.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_IncreaseDownloadCount]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Article_IncreaseDownloadCount]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	update Article
	set
	Downloads = Downloads + 1
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Article_IncreaseViewCount]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Article_IncreaseViewCount]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	update Article
	set
	Views = Views + 1
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Call4Paper_GetActiveCall4Paper]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Call4Paper_GetActiveCall4Paper]
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM Call4Paper
	where Active = 1 and ExpiryDate >= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Call4Paper_GetCall4PaperById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Call4Paper_GetCall4PaperById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM Call4Paper
	where Id = @Id and Active = 1 and ExpiryDate >= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_Admin_DeleteCategoryById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Category_Admin_DeleteCategoryById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Category
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_Admin_GetCategoryById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Category_Admin_GetCategoryById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, SortOrder, CategoryName, CategorySlug
	FROM Category
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_Admin_InsertCategory]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Category_Admin_InsertCategory]
(
    @SortOrder int,
	@CategoryName nvarchar(250),
	@CategorySlug nvarchar(250),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Category (SortOrder, CategoryName, CategorySlug)
	values (@SortOrder, @CategoryName, @CategorySlug)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_Admin_UpdateCategory]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Category_Admin_UpdateCategory]
(
	@Id int,
	@SortOrder int,
    @CategoryName nvarchar(250),
	@CategorySlug nvarchar(250)
)
AS
BEGIN
	set nocount on;
	
	update Category
	set
	SortOrder = @SortOrder,
	CategoryName = @CategoryName,
	CategorySlug = @CategorySlug
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_GetCategories]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Category_GetCategories]
AS
BEGIN
	set nocount on;
	
	SELECT Id, SortOrder, CategoryName, CategorySlug
	FROM Category
	ORDER BY SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Category_GetCategoryNameBySlug]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Category_GetCategoryNameBySlug]
(
	@CategorySlug nvarchar(250)
)
AS
BEGIN
	set nocount on;
	
	SELECT CategoryName FROM Category
	where CategorySlug = @CategorySlug
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_Admin_DeleteIssueById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Issue_Admin_DeleteIssueById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Issue
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_Admin_GetIssues]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_Admin_GetIssues]
AS
BEGIN
	set nocount on;
	
	SELECT 
		Issue.Id, Issue.SortOrder, Issue.Title, Issue.PublishDate,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle ,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM 
		Issue inner join Volume on Issue.VolumeId = Volume.Id 
		inner join Journal on Volume.JournalId = Journal.Id 
		inner join Category on Journal.CategoryId = Category.Id
	order by Category.SortOrder, Journal.SortOrder, Volume.SortOrder, Issue.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_Admin_GetIssuesByJournal]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_Admin_GetIssuesByJournal]
(
	@JournalId int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Issue.Id, Issue.SortOrder, Issue.Title, Issue.PublishDate,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM Issue inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	where Issue.VolumeId in (select Id from Volume where JournalId = @JournalId)
	order by Volume.SortOrder, Issue.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_Admin_InsertIssue]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_Admin_InsertIssue]
(
    @VolumeId int,
	@SortOrder int,
    @Title nvarchar(250),
    @PublishDate datetime2(7),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Issue (VolumeId, SortOrder, Title, PublishDate)
	values (@VolumeId, @SortOrder, @Title, @PublishDate)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_Admin_UpdateIssue]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_Admin_UpdateIssue]
(
	@Id int,
    @VolumeId int,
	@SortOrder int,
    @Title nvarchar(250),
    @PublishDate datetime2(7)
)
AS
BEGIN
	set nocount on;
	
	update Issue
	set
	VolumeId = @VolumeId,
	SortOrder = @SortOrder,
	Title = @Title,
	PublishDate = @PublishDate
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_GetIssueById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_GetIssueById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Issue.Id, Issue.SortOrder, Issue.Title, Issue.PublishDate,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM Issue inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	where Issue.Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Issue_GetIssuesByVolume]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Issue_GetIssuesByVolume]
(
	@VolumeId int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Issue.Id, Issue.SortOrder, Issue.Title, Issue.PublishDate,
		Volume.Id as VolumeId, Volume.Title as VolumeTitle,
		Journal.Id as JournalId, Journal.Title as JournalTitle
	FROM Issue inner join Volume on Issue.VolumeId = Volume.Id
		inner join Journal on Volume.JournalId = Journal.Id
	where Issue.VolumeId = @VolumeId
	order by Issue.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_Admin_DeleteJournalById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Journal_Admin_DeleteJournalById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Journal
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_Admin_InsertJournal]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Journal_Admin_InsertJournal]
(
    @CategoryId int,
	@SortOrder int,
    @Title nvarchar(250),
	@EditorialAdvisors nvarchar(max),
	@EditorialBoard nvarchar(max),
    @ChiefPatronMessage nvarchar(max),
    @EditorsNote nvarchar(max),
    @ImageFile nvarchar(250),
    @IssuedSince datetime2(7),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Journal (CategoryId, SortOrder, Title, EditorialAdvisors, EditorialBoard, ChiefPatronMessage, EditorsNote, ImageFile, IssuedSince)
	values (@CategoryId, @SortOrder, @Title, @EditorialAdvisors, @EditorialBoard, @ChiefPatronMessage, @EditorsNote, @ImageFile, @IssuedSince)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_Admin_UpdateJournal]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Journal_Admin_UpdateJournal]
(
	@Id int,
    @CategoryId int,
	@SortOrder int,
    @Title nvarchar(250),
	@EditorialAdvisors nvarchar(max),
	@EditorialBoard nvarchar(max),
	@ChiefPatronMessage nvarchar(max),
    @EditorsNote nvarchar(max),
    @ImageFile nvarchar(250),
    @IssuedSince datetime2(7)
)
AS
BEGIN
	set nocount on;
	
	update Journal
	set
	CategoryId = @CategoryId,
	SortOrder = @SortOrder,
	Title = @Title,	
	EditorialAdvisors = @EditorialAdvisors,
	EditorialBoard = @EditorialBoard,	
	ChiefPatronMessage = @ChiefPatronMessage,
	EditorsNote = @EditorsNote,
	ImageFile = @ImageFile,
	IssuedSince = @IssuedSince
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_GetJournalById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Journal_GetJournalById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Journal.Id, CategoryId, CategoryName, CategorySlug, Journal.SortOrder, Title, EditorialAdvisors, EditorialBoard, ChiefPatronMessage, EditorsNote, ImageFile, IssuedSince
	FROM Journal inner join Category on Journal.CategoryId = Category.Id
	where Journal.Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_GetJournals]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Journal_GetJournals]
AS
BEGIN
	set nocount on;
	
	SELECT
		CategoryId, Category.SortOrder, CategoryName, CategorySlug,
		Journal.Id, Journal.SortOrder, Title, EditorialAdvisors, EditorialBoard, ChiefPatronMessage, EditorsNote, ImageFile, IssuedSince
	FROM Journal inner join Category on Journal.CategoryId = Category.Id
	order by Category.SortOrder, Journal.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Journal_GetJournalsByCategorySlug]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Journal_GetJournalsByCategorySlug]
(
	@CategorySlug nvarchar(250)
)
AS
BEGIN
	set nocount on;
	
	SELECT
		CategoryId, Category.SortOrder, CategoryName, CategorySlug,
		Journal.Id, Journal.SortOrder, Title, EditorialAdvisors, EditorialBoard, ChiefPatronMessage, EditorsNote, ImageFile, IssuedSince
	FROM Journal inner join Category on Journal.CategoryId = Category.Id
	where CategorySlug = @CategorySlug
	order by Category.SortOrder, Journal.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_Admin_DeleteNewsById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_News_Admin_DeleteNewsById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM News
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_Admin_GetNewsById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_News_Admin_GetNewsById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM News
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_Admin_GetNewsList]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_News_Admin_GetNewsList]
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM News
	ORDER BY PublishDate DESC, Title asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_Admin_InsertNews]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_News_Admin_InsertNews]
(
    @Title nvarchar(250),
    @Details nvarchar(max),
    @PublishDate datetime2(7),
    @ExpiryDate datetime2(7),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into News (Title, Details, PublishDate, ExpiryDate)
	values (@Title, @Details, @PublishDate, @ExpiryDate)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_Admin_UpdateNews]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_News_Admin_UpdateNews]
(
	@Id int,
    @Title nvarchar(250),
    @Details nvarchar(max),
    @PublishDate datetime2(7),
    @ExpiryDate datetime2(7)
)
AS
BEGIN
	set nocount on;
	
	update News
	set
	Title = @Title,
	Details = @Details,
	PublishDate = @PublishDate,
	ExpiryDate = @ExpiryDate
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_GetNewsById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_News_GetNewsById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM News
	where Id = @Id and ExpiryDate >= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_GetNewsList]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_News_GetNewsList]
AS
BEGIN
	set nocount on;
	
	SELECT Id, Title, Details, PublishDate, ExpiryDate
	FROM News
	where ExpiryDate >= GETDATE()
	ORDER BY PublishDate DESC, Title asc
END
GO
/****** Object:  StoredProcedure [dbo].[USP_News_GetPartialNewsList]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_News_GetPartialNewsList]
AS
BEGIN
	set nocount on;
	
	SELECT top(3) Id, Title, Details, PublishDate, ExpiryDate
	FROM News
	where ExpiryDate >= GETDATE()
	ORDER BY PublishDate DESC, Title asc
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Search_SearchByTerm]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Search_SearchByTerm]
(
	@SearchTerm nvarchar(500)
)
AS
BEGIN
	set nocount on;
	
	select distinct Title, ContentType
	from
	(
		SELECT CategoryDisplayName + ' - ' + PageDisplayName as Title, 'Page Content' as ContentType FROM StaticContent
		where PageContent like '%' + @SearchTerm + '%'
		
		union all
		
		SELECT left(Title, 100) as Title, 'News Title' as ContentType FROM News
		where Title like '%' + @SearchTerm + '%' and ExpiryDate >= GETDATE()
		
		union all
		
		SELECT left(Title, 100) as Title, 'News Details' as ContentType FROM News
		where Details like '%' + @SearchTerm + '%' and ExpiryDate >= GETDATE()
		
		union all
		
		SELECT left(Title, 100) as Title, 'Call For Paper Title' as ContentType FROM Call4Paper
		where Title like '%' + @SearchTerm + '%' and ExpiryDate >= GETDATE()
		
		union all
		
		SELECT left(Title, 100) as Title, 'Call For Paper Details' as ContentType FROM Call4Paper
		where Details like '%' + @SearchTerm + '%' and ExpiryDate >= GETDATE()
		
		union all
		
		SELECT left(Title, 100) as Title, 'Article Title' as ContentType FROM Article
		where Title like '%' + @SearchTerm + '%'
		
		union all
		
		SELECT left(Author, 100) as Title, 'Article Author' as ContentType FROM Article
		where Author like '%' + @SearchTerm + '%'
		
		union all
		
		SELECT left(DOI, 100) as Title, 'Article DOI' as ContentType FROM Article
		where DOI like '%' + @SearchTerm + '%'
		
		union all
		
		SELECT left(Title, 100) as Title, 'Article Details' as ContentType FROM Article
		where Details like '%' + @SearchTerm + '%'
	) Combined
	order by ContentType, Title
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Slider_Admin_DeleteSliderById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Slider_Admin_DeleteSliderById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Slider
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Slider_Admin_GetSliderById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Slider_Admin_GetSliderById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, ImageFile, Name, SortOrder
	FROM Slider
	where Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Slider_Admin_InsertSlider]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Slider_Admin_InsertSlider]
(
    @ImageFile nvarchar(250),
    @Name nvarchar(250),
	@SortOrder int,
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Slider (ImageFile, Name, SortOrder)
	values (@ImageFile, @Name, @SortOrder)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Slider_Admin_UpdateSlider]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Slider_Admin_UpdateSlider]
(
	@Id int,
    @ImageFile nvarchar(250),
    @Name nvarchar(250),
	@SortOrder int
)
AS
BEGIN
	set nocount on;
	
	update slider
	set
	ImageFile = @ImageFile,
	Name = @Name,
	SortOrder = @SortOrder
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Slider_GetSliders]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Slider_GetSliders]
AS
BEGIN
	set nocount on;

	SELECT Id, ImageFile, Name, SortOrder
	FROM Slider
	order by SortOrder asc, Name asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_StaticContent_GetContent]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_StaticContent_GetContent]
(
	@PageName NVARCHAR(250)
)
AS
BEGIN
	set nocount on;
	
	SELECT PageContent
	FROM StaticContent
	WHERE PageName = @PageName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_StaticContent_GetContentFull]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_StaticContent_GetContentFull]
(
	@Category NVARCHAR(250),
	@PageName NVARCHAR(250)
)
AS
BEGIN
	set nocount on;
	
	SELECT Id, PageName, PageDisplayName, CategoryName, CategoryDisplayName, PageContent
	FROM StaticContent
	WHERE CategoryName = @Category and PageName = @PageName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_StaticContent_UpdateContent]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_StaticContent_UpdateContent]
(
	@Id int,
	@PageContent NVARCHAR(max)
)
AS
BEGIN
	set nocount on;
	
	update StaticContent
	set PageContent = @PageContent
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_Admin_DeleteVolumeById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_Volume_Admin_DeleteVolumeById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	delete 
	FROM Volume
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_Admin_GetVolumeById]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Volume_Admin_GetVolumeById]
(
	@Id int
)
AS
BEGIN
	set nocount on;
	
	SELECT 
		Volume.Id, Volume.SortOrder, Volume.Title,
		Journal.Id as JournalID, Journal.Title as JournalName
	FROM Volume inner join Journal on Volume.JournalId = Journal.Id
	where Volume.Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_Admin_GetVolumes]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Volume_Admin_GetVolumes]
AS
BEGIN
	set nocount on;
	
	SELECT 
		Volume.Id, Volume.SortOrder, Volume.Title,
		Journal.Id as JournalID, Journal.Title as JournalName
	FROM Volume inner join Journal on Volume.JournalId = Journal.Id inner join Category on Journal.CategoryId = Category.Id
	order by Category.SortOrder, Journal.SortOrder, Volume.SortOrder
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_Admin_InsertVolume]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Volume_Admin_InsertVolume]
(
    @JournalId int,
	@SortOrder int,
    @Title nvarchar(250),
    @Id int output
)
AS
BEGIN
	set nocount on;
	
	insert into Volume (JournalId, SortOrder, Title)
	values (@JournalId, @SortOrder, @Title)
	
	set @Id = SCOPE_IDENTITY()
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_Admin_UpdateVolume]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Volume_Admin_UpdateVolume]
(
	@Id int,
	@SortOrder int,
    @JournalId int,
    @Title nvarchar(250)
)
AS
BEGIN
	set nocount on;
	
	update Volume
	set
	JournalId = @JournalId,
	SortOrder = @SortOrder,
	Title = @Title
	where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Volume_GetVolumesByJournal]    Script Date: 11/24/2020 3:11:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Volume_GetVolumesByJournal]
(
	@JournalID int
)
AS
BEGIN
	set nocount on;
	
	SELECT
		Volume.Id, Volume.SortOrder, Volume.Title,
		Journal.Id as JournalID, Journal.Title as JournalName
	FROM Volume inner join Journal on Volume.JournalId = Journal.Id
	where JournalID = @JournalID
	order by Volume.SortOrder
	
END
GO
USE [master]
GO
ALTER DATABASE [BUPJ] SET  READ_WRITE 
GO
