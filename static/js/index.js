d3.json("/sqltest").then(data => {
    let first5 = data.slice(0,5);
    d3.select("#data-goes-here").selectAll("li")
        .data(first5)
        .enter()
        .append("li")
        .text(data => `${data.first_name} ${data.last_name}`)
})