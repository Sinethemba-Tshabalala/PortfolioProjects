# Web Scraping Real Data From Wikipedia Page + Pandas Project

### Importing BeautifulSoup and requests packages

```python
from bs4 import BeautifulSoup
import requests
```

### Specifying URL to scrap data from

```python
url = 'https://en.wikipedia.org/wiki/List_of_largest_companies_in_the_United_States_by_revenue'
```

### Using requests to get URL into session

```python
page = requests.get(url)
```

### Getting HTML from page and assigning it variable 'soup'

```python
soup = BeautifulSoup(page.text, 'html')
```

```python
print(soup).prettify
```

### Specifying table within HTML to scrape data from and assigning specified table a variable

```python
soup.find('table', class_ = 'wikitable sortable')
```
 
```python
table = soup.find('table', class_ = 'wikitable sortable')
```

```python
print(table)
```

### Pulling table headers

```python
world_titles = table.find_all('th')
```

```python
world_titles
```

    [<th>Rank
     </th>,
     <th>Name
     </th>,
     <th>Industry
     </th>,
     <th>Revenue <br/>(USD millions)
     </th>,
     <th>Revenue growth
     </th>,
     <th>Employees
     </th>,
     <th>Headquarters
     </th>]


```python
world_table_titles = [title.text.strip() for title in world_titles]

print(world_table_titles)
```

    ['Rank', 'Name', 'Industry', 'Revenue (USD millions)', 'Revenue growth', 'Employees', 'Headquarters']
    

### Importing pandas package and creating DataFrame to store scraped data

```python
import pandas as pd
```

```python
df = pd.DataFrame(columns = world_table_titles)

df
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Rank</th>
      <th>Name</th>
      <th>Industry</th>
      <th>Revenue (USD millions)</th>
      <th>Revenue growth</th>
      <th>Employees</th>
      <th>Headquarters</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>


### Pulling row and individual data and populating the created DataFrame 'df'

```python
column_data = table.find_all('tr')
```

```python
for row in column_data[1:]:
    row_data = row.find_all('td')
    individual_row_data = [data.text.strip() for data in row_data]
    
    length = len(df)
    df.loc[length] = individual_row_data
```

```python
df
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Rank</th>
      <th>Name</th>
      <th>Industry</th>
      <th>Revenue (USD millions)</th>
      <th>Revenue growth</th>
      <th>Employees</th>
      <th>Headquarters</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Walmart</td>
      <td>Retail</td>
      <td>611,289</td>
      <td>6.7%</td>
      <td>2,100,000</td>
      <td>Bentonville, Arkansas</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Amazon</td>
      <td>Retail and cloud computing</td>
      <td>513,983</td>
      <td>9.4%</td>
      <td>1,540,000</td>
      <td>Seattle, Washington</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>ExxonMobil</td>
      <td>Petroleum industry</td>
      <td>413,680</td>
      <td>44.8%</td>
      <td>62,000</td>
      <td>Spring, Texas</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Apple</td>
      <td>Electronics industry</td>
      <td>394,328</td>
      <td>7.8%</td>
      <td>164,000</td>
      <td>Cupertino, California</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>UnitedHealth Group</td>
      <td>Healthcare</td>
      <td>324,162</td>
      <td>12.7%</td>
      <td>400,000</td>
      <td>Minnetonka, Minnesota</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>95</th>
      <td>96</td>
      <td>Best Buy</td>
      <td>Retail</td>
      <td>46,298</td>
      <td>10.6%</td>
      <td>71,100</td>
      <td>Richfield, Minnesota</td>
    </tr>
    <tr>
      <th>96</th>
      <td>97</td>
      <td>Bristol-Myers Squibb</td>
      <td>Pharmaceutical industry</td>
      <td>46,159</td>
      <td>0.5%</td>
      <td>34,300</td>
      <td>New York City, New York</td>
    </tr>
    <tr>
      <th>97</th>
      <td>98</td>
      <td>United Airlines</td>
      <td>Airline</td>
      <td>44,955</td>
      <td>82.5%</td>
      <td>92,795</td>
      <td>Chicago, Illinois</td>
    </tr>
    <tr>
      <th>98</th>
      <td>99</td>
      <td>Thermo Fisher Scientific</td>
      <td>Laboratory instruments</td>
      <td>44,915</td>
      <td>14.5%</td>
      <td>130,000</td>
      <td>Waltham, Massachusetts</td>
    </tr>
    <tr>
      <th>99</th>
      <td>100</td>
      <td>Qualcomm</td>
      <td>Technology</td>
      <td>44,200</td>
      <td>31.7%</td>
      <td>51,000</td>
      <td>San Diego, California</td>
    </tr>
  </tbody>
</table>
<p>100 rows × 7 columns</p>
</div>


### Exporting table as 'csv' file

```python
df.to_csv(r'C:\Users\use\Documents\Python Project Docs/Companies.csv', index = False)
```

### END
