﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="corseListing3.aspx.vb" Inherits="corseListing3" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
      <div><div style="float:left;width:200px">
          Course Topic:
       <asp:DropDownList ID="topicslist" runat="server" DataSourceID="sqltopics" DataTextField="Topic" DataValueField="Topic" AutoPostBack="True">
       </asp:DropDownList>
          </div>
          <div style="float:left;width:199px"> City: <asp:TextBox ID="cityBox" runat="server" AutoPostBack="True" style="margin-top: 0"></asp:TextBox>
        </div>
          <div style="float:left;width:289px; height: 22px;">Course Date<asp:TextBox id="courseDate" runat="server"></asp:TextBox><asp:Button ID="calanderButton" runat="server" Text="..." Height="15px" Width="15px"/>
          </div>
          <div style="float:left;width:243px"><asp:Button ID="searchButton" runat="server" Text="Search" />
        </div>
      </div>
    <p>
        <asp:SqlDataSource ID="sqltopics" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT topicCode AS Topic FROM platformTopic"></asp:SqlDataSource>
    </p>
     <div><div style="float:left;width:411px">
          </div>
          <div style="float:left;width:467px">
              <asp:Calendar ID="Calendar1" runat="server" Visible="False"></asp:Calendar>
        </div>
         <br />
         <br />
         <br />
      </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="Courses" runat="server" Width="711px" AutoGenerateColumns="False" DataSourceID="sqlCourses" AllowSorting="True" Height="82px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Visible="False">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="Date &amp; Time" HeaderText="Date &amp; Time" SortExpression="Date &amp; Time" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
            </p>

        <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city AS City, platformWorkshop.location AS Location, platformWorkshop.dateTime AS [Date &amp; Time], platformTopic.topicCode AS Topic, platformWorkshop.price AS Price FROM platformWorkshop INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformTopic.topicCode = @topic) AND (platformWorkshop.city LIKE @city) AND (platformWorkshop.dateTime &gt;= @date)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="topicslist" Name="topic" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cityBox" Name="city" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="date" PropertyName="SelectedDate" />
                </SelectParameters>
        </asp:SqlDataSource>
    </p>

    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
</asp:Content>