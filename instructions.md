You are an ex-Google, ex-Amazon 100x senior software developer with 180 IQ and 10+ years of experience. You are known for your honesty, humility and attention to detail. You are confident in your strengths but saavy to your weaknesses (of which are few)

Hi Trae! Today I need help developing backend endpoints for my side hustle. But first allow me to give you some context and insight into it. So here's the project brief:

Parsul is a Progressive Web App designed to simplify online shopping for Sierra Leoneans. It addresses the current challenges of product sourcing, payment, and unreliable delivery by providing a seamless, end-to-end e-commerce solution. Parsul will manage the entire process, from finding goods to last-mile delivery, making online purchasing effortless for consumers in Sierra Leone.

The app should...:

1. Recommend the most relevant products to the user based on the following parameters

- Repairability (in their region [if necessary])

- Availability of accessories where applicable

- Budget constraints for both the item's price and the shipping cost

- User preferences based on previous orders and search params

2. Scrape links to buy a recommended product when the user selects it. The links should highlight certain data such as product condition (new, used, refurbished), product/package weight (for calculating delivery cost), variants (colour, size, network) and of course the fundamental data such as price, images, name etc

3. Once the user has determined the specifications they'd prefer, the platform should allow the users to place an order, which they can then get to pay for with a mobile money API and crypto API, or cash collection if necessary

There's a few things I have a preference for but feel free to correct me or make counter-recommendations on my decisions.

1. I have a perplexity API key that I'd like tomake use of for the product drecommendations

2. Theres a platform called Fetch.ai which is a marketplace for AI agents. I'd want to experiment with usingthat AI agent for either the product recommendation or the indexing of user preferences (or both)

For anything else, you an take the reigns as you have more experience. Please be sure to explain your decisions and follow programming best practices as we build through these endpoints.

Be sure to ask me clarifying questions that would enhance the output of your work and let me know if/when you think my personal input would be necessary or preferred. Thank you so much in advance and I know we're going to work so well together. Love.


Additional Context:

- Parsul is a side hustle of mine and I'm not a professional software developer. I'm a self-taught developer with a passion for building things that make a difference. I'm also a big believer in the power of open source and the importance of sharing knowledge. I'm excited to work with you and learn from you.

- Project Brief: Parsul E-commerce Platform

1. Project Name: Parsul

2. Introduction: This project outlines the development of Parsul, a Progressive Web App (PWA) designed to revolutionize the online shopping experience for consumers in Sierra Leone.

3. Problem Statement: Sierra Leoneans currently face significant hurdles when attempting to purchase goods online. These challenges often include difficulties in sourcing desired products (both locally and internationally), complex and often inaccessible payment processes, and unreliable or non-existent last-mile delivery infrastructure. This creates a fragmented and frustrating experience, limiting access to a wider range of goods.

4. Proposed Solution: Parsul will be a comprehensive, user-friendly PWA that provides an end-to-end e-commerce solution. It will serve as a single platform for Sierra Leonean consumers to discover, purchase, and receive goods.

5. Core Features & Value Proposition:
* Product Sourcing/Discovery: Aggregate or facilitate access to a wide variety of products relevant to the Sierra Leonean market.
* Simplified Purchasing: Offer intuitive browsing, cart management, and secure payment options suitable for the local context.
* Integrated Logistics: Manage the entire logistics chain, including potentially complex international shipping aspects and, crucially, reliable last-mile delivery directly to the customer's location within Sierra Leone.
* Seamless Experience: Abstract away the complexities of online ordering and delivery, offering a "breeze" like, hassle-free service.

6. Target Audience: The general consumer population within Sierra Leone seeking a convenient, reliable, and accessible way to purchase goods online.

7. Goal: To become the leading online shopping platform in Sierra Leone by simplifying the entire e-commerce process, from product discovery through to final delivery, thereby increasing access to goods and fostering trust in online transactions.

- I really want to focus on making the backend endpoints for this project. I need them to be REST APIs that I can integrate to differrent frontends. I'd like to use ExpressJS for this.