# Analysis of OTC patterns
# By Matthew, Alyssa, Gregory, Daria, and Daniel

## Business Problem / Problem Statement 
This project involves an in-depth technical analysis of OTC Market transactions, providing investment solutions for securities not on a traditional exchange. These securities can include any derivative securities such as a stock or bond, but pose limited transparency, lack of liquidity, and limited available public information. This will allow the company to enhance its current offerings by providing investors with insights into market trends and sector-based trading problems. Through deep learning algorithms, the project will focus on providing a profit from the OTC market.

## Description of the company
Our company specializes in advanced financial analytics and solutions for Over-The-Counter (OTC) market transactions. The OTC market is a decentralized marketplace where securities not listed on traditional exchanges, such as the NYSE or NASDAQ, are traded directly between parties. It includes stocks, bonds, derivatives, and currencies, often involving smaller or less regulated companies. Transactions typically occur via brokers or electronic networks rather than through a centralized exchange.


## Business Requirements 
1. Developing a product to analyze the OTC market using technical analysis to evaluate if it can be profitable 
2. Creating a time series visualization to see market trends by analyzing for price per security 
3. Generating bar charts to visualize the volume per sector and volume per security, to understand the trading activity


## Functional Requirements
1. Designing bar charts showing trading volumes: one chart focusing on volume per sector and another on volume per security.
2. Creating time series graphs that plot price per security over time to identify trends and patterns in the trading activity.
3. Ensure time series data is modeled accurately to ensure accurate technical analysis. 
4. Use technical analysis indicators to generate actionable trading insights.
5. Future Development: Explore deep learning models to analyze and predict price and volume trends, uncovering patterns in the data.


## Data Requirements
1. Utilizing OTC-specific data, including Security ID, Company ID, Trading Symbol, and related attributes, for targeted analysis.
2. Extracting metadata to add context and enrich insights.
3. Handling historical price and volume datasets properly, ensuring they are clean, conformed, current, comprehensive, and consistent.
 

## Technical Requirements
1. Setting up a data storage and management system to handle OTC market data efficiently.
2. Processing data by cleaning, transforming, and preparing it for analysis and visualization.
3. Analyzing price and volume data to extract actionable insights.
4. Future step: Integrate deep learning models to enhance analysis capabilities and improve prediction accuracy.
5. Building visualization tools that present technical analysis results, those being time series graphs and bar charts.
6. Ensuring the system performs well and scales to accommodate increasing data and user demands.
7. Infrastructure Standards: Defining the necessary hardware and software to support the system
8. Technology Directions: Aligning the system with strategic technology goals to ensure long-term success.
9. Vendor Policies: Following vendor selection guidelines to ensure quality and compliance
10. Cloud vs. On-Premises: Work is going to be performed on cloud
11. Data Center Policies: Addressing data center location and access policies to ensure secure data handling


## Regulatory Requirements
1. Market Volatility and Data Quality: Market trends are unpredictable and combined with potential inaccuracies in data, this could lead to wrong insights and unactionable decisions.
2. Compliance and Regulatory Risks: Ensuring compliance with SEC, FINRA, and other regulations is important so legal and financial repercussions can be avoided.
3. Technical Implementation Risks: Challenges in integrating systems, managing large datasets, or implementing deep learning models could delay the project and affect performance.


## Business Impact
#### Risks
1. Market Volatility and Data Quality: Market trends are unpredictable and combined with potential inaccuracies in data, this could lead to wrong insights and unactionable decisions.
2. Compliance and Regulatory Risks: Ensuring compliance with SEC, FINRA, and other regulations is important so legal and financial repercussions can be avoided.
3. Technical Implementation Risks: Challenges in integrating systems, managing large datasets, or implementing deep learning models could delay the project and affect performance.

#### Costs
1. Development costs: Expenses associated with building data storage, analysis, and visualizations.
2. Maintain and data acquisition: Continuous costs for managing systems, keeping accurate, good quality, and up-to-date OTC market data. 
3. Infrastructure costs: Cost to acquire and maintain hardware, software, cloud storage, and processing power/speed to ensure system performance and scalability. 

#### Benefits
1. Competitive advantage: Provides unique insights into OTC market trends, giving users an advantage over competition 
2. Operation efficiency: Streamlines data analysis and decision-making processes, which reduces manual labor
3. Confidence in trades: Makes traders more confident due to reliable technical analysis, minimizing guesswork and emotional decisions.


### Company Benefit
1. Improved decision-making: Supports data-driven strategies, enabling better investment decisions and portfolio management.
2. Company benefits: Drives revenue growth, increases user satisfaction through actionable insights, and enhances operational efficiency across the company.
3. Moonshot benefit:
   - Expanded revenue streams: New income opportunities by providing additional services.
   - Market leadership: Positions the company as an industry leader in OTC market analysis.
   - Increased number of users: Attracts more users due to the features and insights offered.

## Business Persona
1. Traders/Investors: Utilize the platform for actionable insights to guide buying and selling decisions.
2. Portfolio Manager and Financial Advisor: Leverage the tool for portfolio analysis and to meet client goals.
3. Data scientists/ data engineers: Use the system for data analysis, model testing, and reporting.
4. Risk managers: Analyze market trends and risks to mitigate losses.
5. Executive: Review data-driven insights to make business decisions.

## Data 
1. Company CSV Data: Contains information about companies, including identifiers such as Company ID, names, etc.
2. Securities CSV Data: Includes details about securities, such as Security ID, Trading Symbol, price history, trading volume, etc.\
3. GICS data: Global Industry Classification Standard data provides sector and industry-level context.

## Methods
1. DBT: Used for data modeling and snowflake schema creation.
2. Google Cloud: Serves as the primary storage solution, hosting raw, intermediate, and processed data.
3. Apache Beam: Facilitates data ingestion and consolidation, ensuring data flow from source to storage

## Data Tools
1. Data Storage: Google Cloud Storage is used for scalable, secure, and centralized data storage.
2. Data Processing: How are you going to process/ingest the data?
3. Data Orchestration: Are you using any type of tools to automate your data pipeline

## Interface
1. Tree Map Visualization: Displays hierarchical data, such as market share by sector and industry.
2. Bar Charts:
  - One bar chart visualizes trading volumes by sector.
  - Another bar chart focuses on trading volumes by individual security.
3. Time Series Graph: Shows price trends for individual securities over time, allowing for technical analysis.

## Links
https://classification.codes/classifications/industry/gics/

Link: https://docs.google.com/document/d/1HUXj2bIS_ldO7HUF8v8CM72bVIFwm2IMSr8Cz5d3f_s/edit?usp=sharing
