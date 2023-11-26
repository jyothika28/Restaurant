import re
from flask import Flask, request, flash,redirect,render_template, url_for,session,g, jsonify
import ctypes
import pandas as pd
import os
import uuid
import sys
import datetime
app=Flask(__name__)

import pymysql
from pymysql import Error
from flask import render_template
try:
     # username=input("Enter username ")
     # password=input("Enter password ")

     connection = pymysql.connect(host='localhost', user='root', password='password', db='restaurant', charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)
     
     print("Connected to the database")
     @app.route("/index")
     @app.route("/",methods=['GET','POST'])
     def index():
          return render_template("index.html")

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
                    cursor.callproc('GetChefDetails')
                    for row in cursor.fetchall():
                         if(row['username']==emailId and row['password']==password):
                              presentuser=row['chef_name']
                              session.pop('user',None)
                              session['user']=presentuser
                              cursor.close
                              return redirect(url_for("sess"))      
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
               print(u_password)
               cursor.callproc('add_customer',args=(u_id,u_name,u_email,u_password,u_contactno))
               connection.commit()
               cursor.close
               return redirect(url_for('index'))
               
          pass

 
     def render_navbar():
          
          return render_template('navbar.html',name=session['user'])     
     

          

     @app.route("/sess",methods=['GET','POST'])
     def sess():
          g.user=None
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    #adminloop=getadminDetails()
                    navbarhtml = render_navbar()
                    cursor=connection.cursor()
                    cursor.callproc('GetCuisineDetails')
                    cuisine_list=[]
                    for row in cursor.fetchall():
                         cuisine_list.append(row['cuisine_name'])
                    return render_template("user.html",navbarhtml=navbarhtml,cuisine_list=cuisine_list)
               else:
                    return render_template("index.html")
          else:
          
               return redirect(url_for('index'))
          
     @app.route('/items/<cuisine_name>')
     def view_item(cuisine_name):
     # Your logic to retrieve and display details for the given cuisine
          if 'user' in session:
               g.user=session['user']
               if(g.user):
                    navbarhtml = render_navbar()
                    cursor=connection.cursor()
                    get_cuisine_id="select cuisine_id from cuisine where cuisine_name='"+cuisine_name+"'"
                    print(get_cuisine_id)
                    cursor.execute(get_cuisine_id)
                    for row in cursor.fetchall():
                         retreive_cuisine_id=row['cuisine_id']
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
                    
                    
               

                    return render_template("items.html",navbarhtml=navbarhtml,cuisine_name=cuisine_name,items_list=items_list)

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
    

     if __name__=="__main__":
          app.secret_key='1234'
          app.run(debug=True)
except pymysql.Error as e:
     print("Failed to connect to the database, Invalid credentials:{}".format(e))       