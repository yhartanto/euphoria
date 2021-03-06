<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="content">
        <div class="content">
            <div class="action">
                <c:if test="${message != null}">${message}</c:if>
                <h1>Search for an existing customer</h1>
                <form:form method="POST" action="customer">
                    <div>
                        <label for="firstName">Keyword</label> <input name="keyword" value="${keyword}"
                            placeholder="Enter first name, last name or email address" type="text" />
                    </div>
                    <div>
                        <input type="submit" value="Search" id="search" class="button" />
                    </div>
                </form:form>
                <c:choose>
                    <c:when test="${customers == null}" />
                    <c:when test="${empty customers}">
                        <b>Not found</b>
                    </c:when>
                    <c:otherwise>
                        <tiles:insertDefinition name="dataTableTemplate">
                            <tiles:putAttribute name="theader">
                                <tr>
                                    <th>Customer name</th>
                                    <th>Actions</th>
                                </tr>
                            </tiles:putAttribute>
                            <tiles:putAttribute name="tbody">
                                <c:forEach var="cust" items="${customers}">
                                    <tr>
                                        <td><c:out value="${cust.firstName}" /></td>
                                        <td>
                                            <a href="customer/${cust.customerId}" title="Edit customer" class="floatleft">
                                                <img border="0" hspace="2" class="link" alt="Edit" height="20px" width="20px" src="<c:url value="/"/>resources/images/icons/edit_user.png" />
                                            </a>
                                            <form:form method="POST" action="customer/delete" class="zero-margin">
                                                <input type="hidden" name="customerId" value="${cust.customerId}" />
                                                <input type="submit" value="" id="delete" alt="Delete cusomter" class="icon-user-delete" />
                                            </form:form>
                                        </td>
                                </c:forEach>
                            </tiles:putAttribute>
                        </tiles:insertDefinition>
                    </c:otherwise>
                </c:choose>
                <h1>OR</h1>
                <h1>Create a new customer</h1>
                <form:form method="POST" action="customer" commandName="customer">
                    <div>
                        <label for="firstName">First Name</label>
                        <form:input path="firstName" placeholder="e.g. Jane" />

                    </div>
                    <div>
                        <label for="lastName">Last Name</label>
                        <form:input path="lastName" placeholder="e.g. Doe" />
                    </div>
                    <div>
                        <label for="email">Email</label>
                        <form:input path="email" placeholder="e.g. JaneDoe@email.com" />
                    </div>
                    <div>
                        <input type="submit" value="Create Account" id="create-account" class="button" />
                    </div>
                </form:form>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>