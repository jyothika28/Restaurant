import re
from flask import Flask, request, flash,redirect,render_template, url_for,session,g, jsonify
import ctypes
import pandas as pd
import os
import uuid
import sys
import datetime
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt2
app=Flask(__name__)

import pymysql
from pymysql import Error
from flask import render_template
try:
     # username=input("Enter username ")
     # password=input("Enter password ")

     connection = pymysql.connect(host='localhost', user='Jyothika', password='Hyeg8a@03282',db='restaurant1', charset='utf8mb4',cursorclass=pymysql.cursors.DictCursor)

     print("Connected to the database")
     @app.route("/index")
     @app.route("/",methods=['GET','POST'])
     def index():
          cursor=connection.cursor()
          cursor.execute("SELECT * FROM customer_feedback_view;")
          feedback_list=[]
          for row in cursor.fetchall():
               feedback_dict = {}
               feedback_dict['comments'] = row['comments']
               feedback_dict['customer_name'] = row['customer_name']
               feedback_list.append(feedback_dict)
          print(feedback_list)
          cursor.close
          return render_template("index.html",feedback_list=feedback_list)

     @app.route('/login', methods=['GET', 'POST'])
     def login():
          if request.method == 'POST':
               loginDetails=request.form
               emailId = loginDetails['u_email']
               password = request.form['u_pass']
               print(emailId,password)
               cursor=connection.cursor()
               cursor.callproc('GetCustomerDetails')
               
               for row in cursor.fetchall():
                    if(row['email_id']==emailId and row['password']==password):
                         presentuser=row['customer_name']
                         session['user']=presentuser
                         cursor.close
                         return redirect(url_for("sess"))
               else:
                    cursor = connection.cursor()
                    chef_id_query="select * from chef where email_id='"+emailId+"'"
                    cursor.execute(chef_id_query)
                    if(cursor.rowcount!=0):
                         for row in cursor.fetchall():
                              chef_id=row['chef_id']
                         print(chef_id)
                         if(chef_id[:4]=='CHEF'):
                              cursor.callproc('GetChefDetails')
                              for row in cursor.fetchall():
                                   if(row['email_id']==emailId and row['password']==password):
                                        presentuser=row['chef_name']
                                        session.pop('user',None)
                                        session['user']=presentuser
                                        cursor.close
                                        return redirect(url_for("chef_sess"))   
                              else:
                                   # Show pop for Invalid credentails
                                   cursor.close
                                   ctypes.windll.user32.MessageBoxW(0, "Invalid Credentials", "Error",1)
                                   return redirect(url_for("index"))
                    else:
                         cursor = connection.cursor()
                         manager_id_query="select * from manager where email_id='"+emailId+"'"
                         cursor.execute(manager_id_query)
                         for row in cursor.fetchall():
                              manager_id=row['manager_id']
                         if(manager_id[:3]=='MGR'):
                              cursor.callproc('GetManagerDetails')
                              for row in cursor.fetchall():
                                   if(row['email_id']==emailId and row['password']==password):
                                        presentuser=row['manager_name']
                                        session.pop('user',None)
                                        session['user']=presentuser
                                        cursor.close
                                        return redirect(url_for("manager_sess"))   
                              else:
                                        # Show pop for Invalid credentails
                                   cursor.close
                                   ctypes.windll.user32.MessageBoxW(0, "Invalid Credentials", "Error",1)
                                   return redirect(url_for("index"))
                              
          else:
               return render_template("index.html")
               #return render_template("user.html",name=session['user'])
     
     @app.route("/signup",methods=['GET','POST'])
     def signup():
          if request.method=='POST':
               signupDetails=request.form
               u_name=signupDetails['new_name']
               u_email=signupDetails['new_email']
               u_password=signupDetails['new_password']
               u_contactno=signupDetails['new_phone']
               u_id = str(uuid.uuid4())[:8].replace('-', '').upper()
               cursor=connection.cursor()
               cursor.callproc('add_customer',args=(u_id,u_name,u_email,u_password,u_contactno))
               connection.commit()
               cursor.close
               return redirect(url_for('index'))
               
          pass
     
     @app.route("/makereservation",methods=['GET','POST'])
     def makereservation():
          if request.method=='POST':
               reservationDetails=request.form
               r_name=reservationDetails['res_name']
               r_email=reservationDetails['res_email']
               r_phone=reservationDetails['res_phone']
               r_people=reservationDetails['res_people']
               r_date=reservationDetails['res_date']
               r_time=reservationDetails['res_time']
               r_table=reservationDetails['res_table']
               r_id = str(uuid.uuid4())[:8].replace('-', '').upper()
               print(r_id,r_table,r_name,r_email,r_phone,r_people,r_date,r_time)
               cursor=connection.cursor()
               get_customer_id="select * from customer where email_id='"+r_email+"'"
               cursor.execute(get_customer_id)
               for row in cursor.fetchall():
                    c_id=row['customer_id']
               cursor.callproc('add_reservation',args=(r_id,r_table,r_date,r_time,c_id,r_people))
               connection.commit()
               cursor.close
               return redirect(url_for('sess'))
               
          pass

     @app.route("/addwaitinglist",methods=['GET','POST'])
     def addwaitinglist():
          m_id = request.args.get('manager_id')
          if request.method=='POST':
               waitingListDetails=request.form
               w_name=waitingListDetails['w_name']
               w_email=waitingListDetails['w_email']
               w_phone=waitingListDetails['w_phone']
               w_people=waitingListDetails['w_people']
               w_date=waitingListDetails['w_date']
               w_time=waitingListDetails['w_time']
               w_table=waitingListDetails['w_table']
               w_id = str(uuid.uuid4())[:8].replace('-', '').upper()
               c_id = str(uuid.uuid4())[:8].replace('-', '').upper()
               print(w_id,w_table,w_name,w_email,w_phone,w_people,w_date,w_time,c_id, m_id)
               cursor=connection.cursor()
               get_customer_id="select * from customer where email_id='"+w_email+"'"
               cursor.execute(get_customer_id)
               if(cursor.rowcount==0):
                    # print('1: ', c_id,w_name,w_email,'password',w_phone)
                    cursor.callproc('add_customer',args=(c_id,w_name,w_email,'password',w_phone))
                    connection.commit()
               else:
                    for row in cursor.fetchall():
                         c_id=row['customer_id']
               # print('2: ', w_id,w_table,w_date,w_time,c_id,w_people)
               cursor.callproc('add_waiting_list',args=(w_id,w_table,w_date,w_time,c_id,w_people, m_id))
               connection.commit()
               cursor.close
               return redirect(url_for('manager_sess'))
               
          pass
                    
 
     def render_navbar():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    name=session['user']
                    cursor=connection.cursor()
                    get_customer_details="select * from customer where customer_name='"+name+"'"
                    cursor.execute(get_customer_details)
                    customer_details=[]
                    for row in cursor.fetchall():
                         customer_details.append(row['email_id'])
                         customer_details.append(row['phone_number'])
                    cursor.close
                    return render_template('navbar.html',name=name,customer_details=customer_details)
          else:
               return render_template('index.html')
          
     def render_chefnavbar():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    name=session['user']
                    cursor=connection.cursor()
                    get_customer_details="select * from customer where customer_name='"+name+"'"
                    cursor.execute(get_customer_details)
                    customer_details=[]
                    for row in cursor.fetchall():
                         customer_details.append(row['email_id'])
                         customer_details.append(row['phone_number'])
                    cursor.close
                    return render_template('chef_navbar.html',name=name,customer_details=customer_details)
          else:
               return render_template('index.html')
     
     def render_managernavbar():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    name=session['user']
                    cursor=connection.cursor()
                    get_manager_details="select * from manager where manager_name='"+name+"'"
                    cursor.execute(get_manager_details)
                    manager_details=[]
                    for row in cursor.fetchall():
                         manager_details.append(row['email_id'])
                         manager_details.append(row['manager_id'])
                    cursor.close
                    return render_template('manager_navbar.html',name=name, manager_details=manager_details)
          else:
               return render_template('index.html')
          
          
     
     @app.route("/chef_orders",methods=['GET','POST'])
     def chef_orders():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    chefnavbarhtml = render_chefnavbar()
                    cursor=connection.cursor()
                    cursor.execute("SELECT * FROM chef_orders_view;")
                    orders_list=[]
                    for row in cursor.fetchall():
                         order_dict = {}
                         order_dict['order_id'] = row['order_id']
                         order_dict['order_date'] = row['order_date']
                         order_dict['order_status'] = row['order_status']
                         order_dict['chef_id'] = row['chef_id']
                         orders_list.append(order_dict)
                    cursor.close
                    return render_template("chef_orders.html",chefnavbarhtml=chefnavbarhtml,orders_list=orders_list)

     @app.route("/editorder",methods=['GET','POST'])
     def editorder():
          if(request.method=='POST'):
               editOrderDetails=request.form
               order_id=editOrderDetails['order_id']
               order_status=editOrderDetails['order_status']
               cursor=connection.cursor()
               cursor.callproc('update_order_status',args=(order_id,order_status))
               connection.commit()
               cursor.close
               return redirect(url_for('chef_orders'))
          pass

     @app.route("/deleteorder",methods=['GET','POST'])
     def deleteorder():
          if(request.method=='POST'):
               deleteOrderDetails=request.form
               d_order_id=deleteOrderDetails['delete_order_id']
               cursor=connection.cursor()
               print(d_order_id)
               cursor.callproc('delete_order_id',args=(d_order_id,))
               connection.commit()
               cursor.close
               return redirect(url_for('chef_orders'))

     @app.route("/chef_sess",methods=['GET','POST'])
     def chef_sess():
          g.user=None
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    #adminloop=getadminDetails()
                    chefnavbarhtml = render_chefnavbar()
                    cursor=connection.cursor()
                    #calling the function
                    cursor.execute("SELECT get_cuisine_count() AS cuisine_count;")
                    cuisine_count = cursor.fetchone()['cuisine_count']
                    #calling the procedure
                    cursor.callproc('GetCuisineDetails')
                    cuisine_list=[]
                    for row in cursor.fetchall():
                         cuisine_list.append(row['cuisine_name'])
                    cursor.close
                    return render_template("chef.html",cuisine_list=cuisine_list,cuisine_count=cuisine_count,chefnavbarhtml=chefnavbarhtml)  

     @app.route("/manager_sess",methods=['GET','POST'])
     def manager_sess():
          g.user=None
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    #adminloop=getadminDetails()
                    managernavbarhtml = render_managernavbar()
                    cursor=connection.cursor()
                    #calling the function
                    cursor.execute("SELECT get_cuisine_count() AS cuisine_count;")
                    cuisine_count = cursor.fetchone()['cuisine_count']
                    #calling the procedure
                    cursor.callproc('GetCuisineDetails')
                    cuisine_list=[]
                    for row in cursor.fetchall():
                         cuisine_list.append(row['cuisine_name'])
                    cursor.close
                    return render_template("manager.html",cuisine_list=cuisine_list,cuisine_count=cuisine_count,managernavbarhtml=managernavbarhtml)  

     @app.route("/sess",methods=['GET','POST'])
     def sess():
          g.user=None
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    #adminloop=getadminDetails()
                    navbarhtml = render_navbar()
                    cursor=connection.cursor()
                    #calling the function
                    cursor.execute("SELECT get_cuisine_count() AS cuisine_count;")
                    cuisine_count = cursor.fetchone()['cuisine_count']
                    #calling the procedure
                    cursor.callproc('GetCuisineDetails')
                    cuisine_list=[]
                    for row in cursor.fetchall():
                         cuisine_list.append(row['cuisine_name'])
                    cursor.close
                    return render_template("user.html",navbarhtml=navbarhtml,cuisine_list=cuisine_list,cuisine_count=cuisine_count)
               else:
                    return render_template("index.html")
          else:
          
               return redirect(url_for('index'))
     
     @app.route('/statistics', methods=['GET', 'POST'])
     def statistics():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    managernavbarhtml = render_managernavbar()
                    cuisine_list=[]

                    cursor=connection.cursor()
                    cursor.execute("SELECT * FROM orders_count_by_date")
                    result = cursor.fetchall()

                    dates = [row['order_date'] for row in result]
                    order_counts = [row['order_count'] for row in result]

                    date_strings = [str(date) for date in dates]
                    print(date_strings)
                    print(order_counts)

                    plt.figure(figsize=(13, 9))
                    plt.plot(dates, order_counts, marker='o')
                    plt.title('Number of Orders Over Time')
                    plt.xlabel('Date')
                    plt.ylabel('Number of Orders')
                    plt.xticks(rotation=45)
                    plt.savefig('static/graph.png')

                    cursor.callproc('GetCuisineDetails')
                    for row in cursor.fetchall():
                         cuisine_list.append(row['cuisine_name'])
                    cursor.close
                    print(cuisine_list)

                    if request.method == 'POST':
                         
                         selected_cuisine = request.form.get('cuisine')
                         cursor.execute("SELECT * FROM item_sales_view")
                         sales = filter(lambda row: row['cuisine_name'] == selected_cuisine, cursor.fetchall())
                         
                         items = []
                         quantities = []
                         for row in sales:
                              items.append(str(row['item_name']))
                              quantities.append(row['total_quantity_sold'])
                         
                         print(items)
                         print(quantities)

                         if items == []:
                              no_sales_message = "No sales recorded for " + selected_cuisine + " cuisine"
                              return render_template('statistics.html', managernavbarhtml=managernavbarhtml, cuisines=cuisine_list, no_sales_message=no_sales_message)

                         plt2.figure(figsize=(32, 10))
                         plt2.barh(items, quantities, color='green')
                         plt2.ylabel('Food Item', fontsize=20)
                         plt2.xlabel('Total Quantity Sold', fontsize=20)
                         plt2.title(f'Sales of Food Items in {selected_cuisine}', fontsize=20)
                         plt2.yticks(rotation=60, ha='right', fontsize=15)
                         plt2.savefig('static/sales_graph.png')

                    
                    return render_template('statistics.html', managernavbarhtml=managernavbarhtml, cuisines=cuisine_list, no_sales_message=None)
          
     @app.route('/items/<cuisine_name>')
     def view_item(cuisine_name):
     # Your logic to retrieve and display details for the given cuisine
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    navbarhtml = render_navbar()
                    cursor=connection.cursor()
                    get_cuisine_id="select cuisine_id from cuisine where cuisine_name='"+cuisine_name+"'"
                    cursor.execute(get_cuisine_id)
                    for row in cursor.fetchall():
                         retreive_cuisine_id=row['cuisine_id']
                    #calling the function
                    cursor.execute("SELECT get_item_count_by_cuisine(%s) AS item_count;", (retreive_cuisine_id,))
                    cuisine_item_count=cursor.fetchone()['item_count']
                    cursor.callproc('get_food_item_cuisine',args=(retreive_cuisine_id,))
                    items_list=[]
                    for row in cursor.fetchall():
                         item_dict = {}  # Create a new dictionary for each row
                         item_dict['item_id'] = row['item_id']
                         item_dict['item_name'] = row['item_name']
                         item_dict['item_description'] = row['item_description']
                         item_dict['item_price'] = row['item_price']
                         item_dict['course_name'] = row['course_name']
                         item_dict['diet_name'] = row['diet_name']
                         item_dict['image_url'] = row['image_url']
                         items_list.append(item_dict)
                    cursor.close

                    return render_template("items.html",navbarhtml=navbarhtml,cuisine_name=cuisine_name,items_list=items_list,cuisine_item_count=cuisine_item_count)

          # return f"Viewing details for cuisine: {cuisine_name}"     
     @app.route("/logout",methods=['GET','POST'])
     def logout():
          session.pop('user',None)
          return render_template("index.html")

     cart_items = {}

     @app.route('/add_to_cart/<item_id>', methods=['GET', 'POST'])
     def add_to_cart(item_id):
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    quantity = int(request.form.get('quantity', 1))

                    cursor=connection.cursor()
                    cursor.callproc('get_food_item_details',args=(item_id,))
                    item_details = cursor.fetchall()[0]
                    # Add the item to the cart dictionary
                    cart_items[item_id] = {
                         'quantity': quantity,
                         'name': item_details['item_name'],
                         'price': item_details['item_price'],
                         'image_url': item_details['image_url']
                    }
                    return jsonify({'status': 'success', 'message': 'Item added to cart'})

     @app.route('/view_cart')
     def view_cart():
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    navbarhtml = render_navbar()
                    prices = ""
                    for item_id, item in cart_items.items():
                         prices += str(item['quantity'] * item['price']) + ", "
                    prices = prices[:-2]
                    cursor=connection.cursor()
                    get_total_cost="select calculate_total_cost('"+prices+"')"
                    print(get_total_cost)
                    cursor.execute(get_total_cost)
                    total_cost=cursor.fetchall()[0]['calculate_total_cost(\''+prices+'\')']
                    print(total_cost)
                    
                    return render_template('cart.html', navbarhtml=navbarhtml, cart_items=cart_items, total_cost=total_cost)
     
     @app.route('/save_cart', methods=['POST'])
     def save_cart():
           if 'user' in session:
               g.user=session['user']
               if(g.user):
                    try:
                         order_id = str(uuid.uuid4())[:8].replace('-', '').upper()
                         order_date = datetime.date.today()
                         order_status = 'Pending'
                         cursor=connection.cursor()
                         print('Order id: ', order_id, 'Order date: ', order_date, 'Order status: ', order_status)
                         cursor.callproc('add_order',args=(order_id, order_date, order_status))

                         for item in cart_items:
                              print('Order id: ', order_id, 'Item id: ', item, 'Quantity: ', cart_items[item]['quantity'])
                              cursor.callproc('add_order_item',args=(order_id, item, cart_items[item]['quantity'],))
                              connection.commit()
                         cursor.close

                         cart_items.clear()

                         return jsonify({'status': 'success'})

                    except Exception as e:
                         print(f"Error saving cart: {e}")
                         return jsonify({'status': 'error'})
    
except pymysql.Error as e:
     print("Failed to connect to the database, Invalid credentials:{}".format(e))  
     exit()

if __name__=="__main__":
     app.secret_key='1234'
     app.run(debug=True)
     