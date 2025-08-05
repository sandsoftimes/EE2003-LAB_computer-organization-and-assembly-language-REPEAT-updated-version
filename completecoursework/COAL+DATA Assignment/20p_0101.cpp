#include <iostream>
using namespace std;

struct node
{
    int info;
    node *left, *right;

};

class BST
{

        public:

            node *root, *temp, *temp1, *sucessor;
            int number, key, check, tempNumber, predec;

            void insertion(node *temp);
            void deletion(node *temp, int key);
            void inOrder(node *temp);
            node *suc(node *temp);
            void predecessor(node *temp, int key);
            int  find_Predecessor(node *temp);
            void ssucessor(node *temp, int key);
            int  find_sucessor(node *temp);
            void searching(node *temp, int key);
            int height(node * temp);
            BST();


};

BST :: BST()
{
    root = temp = temp1 = NULL;

}

void BST :: insertion(node *temp)
{
    if(root == NULL)
    {
        temp = new node;
        temp->info = number;
        temp->left = NULL;
        temp->right = NULL;
        root = temp;
        return;

    }

    if(temp->info == number)
    {
        cout<<"Number already Present!!";
        return;

    }

    if(temp->info>number)
    {

        if(temp->left != NULL)
        {
            insertion(temp->left);
            return;

        }

        else
        {

            temp->left = new node;
            temp->left->info = number;
            temp->left->left  = NULL;
            temp->left->right = NULL;
            return;
        }






    }



    if(temp->info<number)
    {

        if(temp->right != NULL)
        {
            insertion(temp->right);
            return;

        }

        else
        {

            temp->right = new node;
            temp->right->info = number;
            temp->right->left  = NULL;
            temp->right->right = NULL;
            return;
        }






    }

}


void BST :: deletion(node *temp, int key)
{

    // IF key is on the root node
   if(key == root->info)
   {
        // case 1

        if((root->left == NULL) && (root->right == NULL))
        {
            delete root;
            root = NULL;
            return;

        }

        // case 2

        else if((root->left== NULL) && (root->right != NULL))
        {
            temp1 = root;
            root = root->right;
            delete temp1;
            temp1 = NULL;
            return;


        }

        else if((root->left!= NULL) && (root->right == NULL))
        {
            temp1 = root;
            root = root->left;
            delete temp1;
            temp1 = NULL;
            return;


        }

        // Case 3


        else if((root->left != NULL) && (root->right != NULL))
        {

           if(root->right->left == NULL)
           {


            sucessor = root->right;
            cout<<"Sucessor from deletion is: "<<sucessor->info<<endl;
            tempNumber = root->info;
            root->info = sucessor->info;
            sucessor->info = tempNumber;
            delete sucessor;
            root->right = NULL;
            return;
        }
            sucessor = suc(root->right);
            cout<<"Sucessor from deletion is: "<<sucessor->left->info<<endl;
            tempNumber = root->info;
            root->info = sucessor->left->info;
            sucessor->left->info = tempNumber;
            delete sucessor->left;
            sucessor->left = NULL;
            return;



        }
}

   else if(key>temp->info)
    {


        if(temp == NULL)
        {
            if(check == 0)
            {

                cout<<"Binary Tree is empty "<<endl;
                return;
            }

            else
            {
                cout<<key<<" not found "<<endl;
                return;

            }

         }



        else if(temp->right->info == key )
        {

            // case 1

            if((temp->right->right==NULL) && (temp->right->left==NULL))
            {
                delete temp->right;
                temp->right = NULL;
                return;

            }

            // Case 2 leaf has 1 child

            else if((temp->right->left != NULL ) && (temp->right->right == NULL))
            {
                        temp1 = temp->right;
                        temp->right = temp->right->left;
                        delete temp1;
                        temp1 = NULL;
                        return;


            }

            else if((temp->right->left == NULL) && (temp->right->right != NULL))
            {

                        temp1 = temp->right;
                        temp->right = temp->right->right;
                        delete temp1;
                        temp1 = NULL;
                        return;

            }


            // Case 3 "X" has two childs
            else if((temp->right->right != NULL) && (temp->right->left != NULL))
            {


              if(temp->right->right->left == NULL)
               {

                sucessor = temp->right; // Actually sucessor is temp->right->right but we have to delete it one step backward....
                // So now sucessor will be "sucessor->right"


                cout<<"Successsor from the deletion updated code: ";
                cout<<sucessor->right->info<<endl;
                tempNumber = temp->right->info;
                temp->right->info = sucessor->right->info;
                sucessor->right->info = tempNumber;
                delete sucessor->right;
                sucessor->right = NULL;
                return;
                }


                else
                {


                sucessor = suc(temp->right->right);

                // Actually sucessor is equal to sucessor->left...But we have to delete it so one step back we are doing this.
                cout<<"Successsor from the deletion: ";
                cout<<sucessor->left->info<<endl;
                tempNumber = temp->right->info;
                temp->right->info = sucessor->left->info;
                sucessor->left->info = tempNumber;
                delete sucessor->left;
                sucessor->left = NULL;
                return;

            }

            }


        else
        {
            check = 1;
            if(temp->right->right==NULL)
            {
                 cout<<key<<" not found"<<endl;
                 return;

            }
            else
            {
                deletion(temp->right,key);

            }
        }
    }

    }

    else if(key < temp->info)
    {

        if(temp == NULL)
        {

           if(check == 1)
           {

                cout<<key<<" not found!"<<endl;
                return;

           }

           else
           {

                cout<<"Binary Search Tree is empty "<<endl;
                return;
            }
        }



        if(temp->left->info==key)
        {


            // Check for the case 1

            if((temp->left->left == NULL) && (temp->left->right == NULL))
            {


                    delete temp->left;
                    temp->left = NULL;
                    return;
            }


            // Case 2

            else if ((temp->left->left != NULL) && (temp->left->right == NULL))
            {


                    temp1 = temp->left;
                    temp->left = temp->left->left;
                    delete temp1;
                    temp1 = NULL;
                    return;
            }


            else if((temp->left->left == NULL) && (temp->left->right != NULL))
            {
                    temp->left = temp->left->right ;
                    delete temp1;
                    temp1 = NULL;
                    return;
            }

            // Case 3


            else if((temp->left->left != NULL) && (temp->left->right != NULL))
            {

               if(temp->left->right->left == NULL)
               {

                sucessor = temp->left; // Actually sucessor is temp->left->right but we have to delete it one step backward....
                // So now sucessor will be "sucessor->right"


                cout<<"Successsor from the deletion: ";
                cout<<sucessor->right->info<<endl;
                tempNumber = temp->left->info;
                temp->left->info = sucessor->right->info;
                sucessor->right->info = tempNumber;
                delete sucessor->right;
                sucessor->right = NULL;
                return;
                }

                else
                {


                sucessor = suc(temp->left->right);
                cout<<"Sucessor : "<<sucessor->left->info<<endl;
                tempNumber = temp->left->info;
                temp->left->info = sucessor->left->info;
                sucessor->left->info = tempNumber;
                delete sucessor->left;
                sucessor->left = NULL;
                return;

                }

            }


        }



        else
        {

            check = 1;

            if(temp->left->left == NULL)
            {
                cout<<key<<" nOt found"<<endl;
                return;

            }

            else
            {
                deletion(temp->left,key);

            }


        }

    }


}

node*  BST ::  suc(node *temp)
{

    // Checking Sucessor one step backward because after deleting it we have make it null....



    if((temp->left->left==NULL) && (temp->left->right==NULL))
    {
        cout<<"Sucessor: "<<temp->info<<endl;
        /*Actually the sucessor is temp->left but we have to Make sure that after deletion
         the node of sucessor should be equal to NULL thats why we are returning one node behind*/
        return temp;
    }

    suc(temp->left);





}

void BST :: predecessor(node *temp, int key)
{

        if(root->info == key)
        {
                if(root->left->right == NULL)
                {

                    cout<<"Predecessor: "<<temp->left->info<<endl;
                    return;

                }

                predec = find_Predecessor(root->left->right);
                cout<<"Predecessor: "<<predec<<endl;





        }





        else if(key>temp->info)
        {

            if(temp->right->info==key)
            {

               if(temp->right->left == NULL)
               {

                cout<<"Their is no predecessor of "<<key<<endl;
                return;

               }

               predec =  find_Predecessor(temp->right->left);
               cout<<"Predecessor: "<<predec<<endl;
               return;

            }

            else
            {

                predecessor(temp->right, key);

            }

        }

        else if(key<temp->info)
        {



            if(temp->left->info==key)
            {

               if(temp->left->left == NULL)
               {
                    cout<<"Their is no predecessor of "<<key<<endl;
                    return;


               }


               predec =  find_Predecessor(temp->left->left);
               cout<<"Predecesor: "<<predec<<endl;
               return;

            }

            else
            {

                predecessor(temp->left, key);


            }



        }





}

int :: BST :: find_Predecessor(node *temp)
{

    if(temp->right == NULL)
    {

            return temp->info;


    }
    find_Predecessor(temp->right);





}



void BST :: ssucessor(node *temp, int key)
{

        if(root->info == key)
        {
                if(root->right->left == NULL)
                {

                    cout<<"Sucessor: "<<root->right->info<<endl;
                    return;

                }

                predec = find_sucessor(root->right->left);
                cout<<"Sucessor: "<<predec<<endl;





        }





        else if(key>temp->info)
        {

            if(temp->right->info==key)
            {
                if(temp->right->right == NULL)
                {
                    cout<<"Their is No sucessor of the "<<key<<endl;
                    return;
                }

               predec =  find_sucessor(temp->right->right);
               cout<<"Sucessor: "<<predec<<endl;
               return;

            }

            else
            {

                ssucessor(temp->right, key);

            }

        }

        else if(key<temp->info)
        {



            if(temp->left->info==key)
            {

              if(temp->left->right==NULL)
              {
                cout<<"Their is no sucessor of the "<<key<<endl;
                return;

              }


               predec =  find_sucessor(temp->left->right);
               cout<<"Sucesssor: "<<predec<<endl;
               return;

            }

            else
            {

                ssucessor(temp->left, key);
            }
       }

}

int :: BST :: find_sucessor(node *temp)
{

    if(temp->left == NULL)
    {

            return temp->info;


    }
    find_Predecessor(temp->left);

}

void BST :: inOrder(node *temp)
{
   if(temp==NULL)
    {
        cout<<" Tree is empty";
        return;
    }


   if( temp->left!=NULL )
    {
    		 inOrder(temp->left);
    }
    cout<<temp->info<<" ";



   if( temp->right!=NULL )
    {
    		 inOrder(temp->right);
    }
}


void BST :: searching(node *temp, int key)
{


    if(temp == NULL)
    {

        if(check == 0)
         {

              cout<<"Tree is empty"<<endl;
              return;
         }

         else
         {

            cout<<key<<" not found"<<endl;
            return;

         }

    }


    else if(root->info == key)
    {

        cout<<"Found"<<endl;
        return;

    }

    else if(key>temp->info)
    {
        if(temp->right != NULL)
        {

            if(temp->right->info==key)
            {

                cout<<"Found"<<endl;
                return;

            }

            else
            {
                check = 1;
                searching(temp->right,key);
            }
        }

        else
        {
            cout<<key<<" not found"<<endl;
            return;

        }



    }



    else if(key<temp->info)
    {

        if(temp->left!=NULL)
        {

            if(temp->left->info==key)
            {

                cout<<"Found"<<endl;
                return;

            }

            else
            {
                check = 1;
                searching(temp->left,key);
            }
        }

        else
        {

            cout<<key<<" Not Found "<<endl;
            return;

        }



    }






}

int BST :: height (node * temp)
{
    if(temp == NULL)
    {
        return 0;

    }

    else
    {
        int lh = height(temp->left);
        int rh = height(temp->right);

        return max(lh,rh)+1;

    }




}


int main()
{
    BST *t;

    t = new BST;

    while(true)
    {
        cout<<"Press  1 to add number"<<endl;
        cout<<"Press  2 to delete the number"<<endl;
        cout<<"Press  3 to print the tree in inOrder"<<endl;
        cout<<"Press  4 to search  "<<endl;
        cout<<"Press  5 to find the  predecessor "<<endl;
        cout<<"Press  6 to find the  sucessor "<<endl;
        cout<<"Press  7 to find height"<<endl;
        cout<<"Press  8 to exit"<<endl;

        int option;
        cin>>option;

        if(option == 1 )
        {
            cout<<"Enter the number you want to add ";
            cin>>t->number;

            t->insertion(t->root);
        }


        else if(option == 2)
        {

            cout<<"Enter the number you want to delete: ";
            cin>>t->key;
            t->deletion(t->root, t->key);

        }


        else if(option == 3 )
        {
            t->inOrder(t->root);

        }


        else if(option == 4)
        {

            cout<<"Enter the number you want: "<<endl;
            cin>>t->key;
            t->searching(t->root, t->key);

        }



        else if(option == 5)
        {

            cout<<"Enter the number you want find predecessor: "<<endl;
            cin>>t->key;
            t->predecessor(t->root, t->key);

        }

         else if(option == 6)
        {

            cout<<"Enter the number you want find predecessor: "<<endl;
            cin>>t->key;
            t->ssucessor(t->root, t->key);

        }



        else if(option == 7)
        {
            int h = t->height(t->root);

            cout<<"Height of the tree is "<<h<<endl;

        }


        else if(option == 8)
        {

            break;

        }



        else
        {
            cout<<"Wrong Input!!!"<<endl;

        }

        cout<<endl;
    }

}