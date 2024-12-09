# Project 7: Analysis of the OTC Market Transaction  
##By:Daria Khotunitskaya, Gregory Sycle,Matthew Richards, Daniel Tlaxcaltecatl, Alyssa Iglesias

### Main Question  
**Can we use this data to make a profit out of the OTC Market? If yes, how much?**  

---

### Business Problem  
This project involves an in-depth technical analysis of OTC Market transactions, providing investment solutions for securities not on a traditional exchange. These securities can include any derivative securities such as a stock or bond, but pose limited transparency, lack of liquidity, and limited available public information. This will allow the company to enhance its current offerings by providing investors with insights into market trends and sector-based trading problems. Through deep learning algorithms, the project will focus on providing a profit from the OTC market.  

---

### Description of the Company  
Our company specializes in advanced financial analytics and solutions for Over-The-Counter (OTC) market transactions. The OTC market is a decentralized marketplace where securities not listed on traditional exchanges, such as the NYSE or NASDAQ, are traded directly between parties. It includes stocks, bonds, derivatives, and currencies, often involving smaller or less regulated companies. Transactions typically occur via brokers or electronic networks rather than through a centralized exchange.  

---

### Requirements  

#### Business Requirements:  
- Develop a product to analyze the OTC market using technical analysis to evaluate profitability.  
- Create time series visualizations to identify market trends by analyzing price per security.  
- Generate bar charts to visualize trading volumes by sector and security to understand trading activity.  

#### Functional Requirements:  
- Design bar charts to display trading volumes: one for volume per sector and another for volume per security.  
- Create time series graphs to plot price per security over time and identify trends.  
- Accurately model time series data for precise technical analysis.  
- Use technical indicators to generate actionable trading insights.  
- **Future Development:** Explore deep learning models for price and volume trend predictions.  

#### Data Requirements:  
- Use OTC-specific data, including Security ID, Company ID, Trading Symbol, and related attributes.  
- Extract metadata to enrich analysis and provide context.  
- Handle historical price and volume datasets with consistency, accuracy, and completeness.  

#### Technical Requirements:  
- Set up a scalable data storage and management system for OTC market data.  
- Clean, transform, and prepare data for analysis and visualization.  
- Analyze price and volume data to extract actionable insights.  
- Build visualization tools, including time series graphs and bar charts, for technical analysis.  
- Ensure scalability and performance to handle increasing data and user demands.  

#### Infrastructure Standards:  
- Define the necessary hardware and software to support the system.  
- Align the system with strategic technology goals to ensure long-term success.  
- Follow vendor selection guidelines to ensure quality and compliance.  
- Perform work on a cloud-based system.  
- Enforce secure data handling and access policies in the cloud.  

#### Regulatory Requirements:  
- Comply with SEC and FINRA regulations governing OTC market activities.  
- Adhere to laws such as Sarbanes-Oxley, HIPAA, and PCI for secure data handling.  
- Continuously monitor regulatory changes to maintain compliance.  

---

### Business Impact  

#### Risks  
- **Market Volatility and Data Quality:** Unpredictable market trends and potential inaccuracies in data could lead to unreliable insights.  
- **Compliance Risks:** Non-compliance with SEC, FINRA, and other regulations may lead to legal or financial issues.  
- **Technical Risks:** Challenges in system integration, managing large datasets, or implementing deep learning could delay the project.  

#### Costs  
- **Development Costs:** Building data storage, analysis, and visualization solutions.  
- **Maintenance and Data Acquisition Costs:** Ongoing costs for managing systems and acquiring high-quality OTC market data.  
- **Infrastructure Costs:** Cloud infrastructure and software for scalability and performance.  

#### Benefits  
- **Competitive Advantage:** Unique insights into OTC market trends, giving users an edge over competitors.  
- **Operational Efficiency:** Streamlined data analysis and decision-making processes reduce manual effort.  
- **Confidence in Trades:** Reliable technical analysis reduces guesswork, increasing trader confidence.  

#### Company Benefits  
- **Improved Decision-Making:** Data-driven strategies enable better investment decisions.  
- **Revenue Growth:** Drives company growth through enhanced user satisfaction and actionable insights.  
- **Moonshot Benefit:**  
  - Expanded Revenue Streams: New income opportunities via additional services.  
  - Market Leadership: Positions the company as an OTC market analysis leader.  
  - User Growth: Attracts more users through advanced features and insights.  

---

### Business Persona  

1. **Traders/Investors:** Utilize actionable insights for buying and selling decisions.  
2. **Portfolio Managers and Financial Advisors:** Leverage tools for portfolio analysis and client goal achievement.  
3. **Data Scientists and Engineers:** Use the system for data analysis, model testing, and reporting.  
4. **Risk Managers:** Analyze market trends and risks to mitigate losses.  
5. **Executives:** Use data-driven insights for strategic decision-making.  

---

### Data  

1. **Company CSV Data:** Contains information about securities and their market positions.  
2. **Market CSV Data:** Provides insights into the performance of securities in the market.  
3. **Securities CSV Data:** Details Security ID, Trading Symbol, price history, trading volume, etc.  
4. **GICS Data:** Offers sector and industry-level context with the Global Industry Classification Standard.  

---

### Methods  

1. **DBT:**  
   - Used for data modeling and star schema creation.  
   - Automates data transformations and pipeline workflows.  

2. **Google Cloud:**  
   - Serves as the primary storage and processing platform.  
   - Hosts raw, intermediate, and processed data.  

3. **BigQuery:**  
   - Facilitates data cleaning, querying, and loading.  
   - Handles large datasets efficiently with SQL-based transformations.  

4. **Power BI:**  
   - Creates visualizations and reports for user insights.  

---

### Data Tools  

#### Data Storage:  
Google Cloud Storage for secure, scalable, centralized storage.  

#### Data Processing/Ingestion:  
Google BigQuery for raw data cleaning, structuring, and transformations.  

#### Data Orchestration:  
DBT for structured pipeline automation, building star schemas, and ensuring data lineage.  

---

### Interface  

1. **Tree Map Visualization:**  
   - Displays hierarchical data like market share by sector and industry.  
   - Highlights size and composition of each sector.  

2. **Bar Charts:**  
   - Trading Volumes by Sector: Highlights trading activity across sectors.  
   - Trading Volumes by Security: Focuses on individual securities.  

3. **Time Series Graph:**  
   - Tracks price trends for individual securities over time.  
   - Enables technical analysis of securities.  


